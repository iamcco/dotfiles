import { commands, workspace, Disposable, ExtensionContext } from 'coc.nvim'
import path from 'path'

const patternWebpack = /ERROR\sin\s(?<filename>\S+)\s(?<line>\d+):(?<col>\d+)/
const errorPattern = /ERROR\sin\s(?<filename>[^(]+)\((?<line>\d+),(?<col>\d+)\)/

export function activate(context: ExtensionContext) {
  let { nvim } = workspace
  let statusItem = workspace.createStatusBarItem(1, { progress: true })
  let task = workspace.createTask('WEBPACK')
  let cwd: string

  async function check () {
    let running = await task.running
    if (running) {
      statusItem.isProgress = false
      statusItem.text = '?'
      statusItem.show()
    } else {
      statusItem.hide()
    }
  }
  check().catch(_e => {
    // noop
  })
  task.onExit(code => {
    if (code !== 0) {
      workspace.showMessage(`Webpack exit with code ${code}`, 'warning')
    }
    statusItem.hide()
  })
  task.onStdout(lines => {
    let i = 0
    let items = []
    for (let line of lines) {
      if (line.indexOf('ERROR') !== -1) {
        let res = patternWebpack.exec(line)
        if (res == null) {
          res = errorPattern.exec(line)
        }
        if (res != null) {
          let { filename } = res.groups!
          if (!path.isAbsolute(filename)) {
            filename = path.join(cwd, filename)
          }
          items.push({
            filename,
            lnum: parseInt(res.groups!.line),
            col: parseInt(res.groups!.col),
            text: lines[i + 1].trim(),
            type: 'E'
          })
        }
      }
      i++
    }
    nvim.call('setqflist', [items], true)
    statusItem.text = items.length === 0 ? '✓' : '✗'
    statusItem.isProgress = false
  })
  task.onStderr(lines => {
    for (let line of lines) {
      if (line.match(/webpack\sis\swatching/)) {
        statusItem.text = 'watching'
      }
    }
  })

  context.subscriptions.push(Disposable.create(() => {
    task.dispose()
  }))
  context.subscriptions.push(commands.registerCommand('webpack.watch', async () => {
    cwd = workspace.cwd
    task.start({
      cmd: './node_modules/.bin/webpack',
      args: ['--watch', '--no-color'],
      cwd: workspace.cwd
    })
    statusItem.show()
  }))
}
