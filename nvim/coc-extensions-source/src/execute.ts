const {Uri, commands, workspace, window, Mutex} = require('coc.nvim')
const path = require('path')

const programMap = {
  javascript: 'node',
  typescript: 'ts-node',
  python: 'python'
}
let global_id = 0

exports.activate = async (context: { subscriptions: { dispose: () => void }[] }) => {
  const {nvim, cwd} = workspace
  // bufnr => Task
  const taskMap = new Map()

  let statusItem = window.createStatusBarItem(0, {progress: true})
  context.subscriptions.push(statusItem)

  const executeFile = async (doc: { uri: any; bufnr: any; filetype: string | number }, create: boolean) => {
    let uri = doc.uri
    let relPath = path.relative(cwd, Uri.parse(uri).fsPath)
    let bufname = `__coc_execute_${doc.bufnr}__`
    let task = taskMap.get(doc.bufnr)
    if (task) {
      task.dispose()
      taskMap.delete(doc.bufnr)
    }
    statusItem.hide()
    let winnr = await nvim.call('bufwinnr', [bufname])
    if (winnr == -1 && !create) return
    if (winnr == -1) {
      await nvim.command(`belowright vs ${bufname}`)
      nvim.pauseNotification()
      nvim.command(`setl buftype=nofile`)
      nvim.command(`setl conceallevel=0`)
      nvim.command(`setl norelativenumber`)
      await nvim.resumeNotification()
      winnr = await nvim.call('winnr', [])
      await nvim.command('wincmd p')
    } else {
      // clear buffer
      await nvim.command(`silent call deletebufline('${bufname}', 1, '$')`)
    }
    let bufId = await nvim.call('bufnr', [bufname])
    let buf = nvim.createBuffer(bufId)
    let t = workspace.createTask(`execute-${global_id}`)
    global_id = global_id + 1
    let cmd = (programMap as any)[doc.filetype]
    // start with options
    let succeed = await t.start({cwd, cmd, args: [relPath]})
    if (!succeed) {
      window.showErrorMessage(`Command failed to start: ${cmd} ${relPath}`)
      return
    }
    statusItem.text = `${cmd} ${relPath}`
    statusItem.show()
    taskMap.set(doc.bufnr, t)
    t.onExit((code: number) => {
      statusItem.hide()
      taskMap.delete(doc.bufnr)
      if (code != 0) {
        window.showErrorMessage(`${cmd} exit with code: ${code}`)
      }
    })
    let empty = true
    let appendLines = async (lines: any) => {
      if (empty) {
        empty = false
        await buf.setLines(lines, {start: 0, end: -1, strictIndexing: false})
      } else {
        await nvim.call('appendbufline', [buf.id, '$', lines])
      }
    }
    let mutex = new Mutex()
    t.onStderr(async (lines: string | any[]) => {
      let replace = empty
      let release = await mutex.acquire()
      try {
        let len = await buf.length
        await appendLines(lines)
        await buf.highlightRanges('coc-execute', 'WarningMsg', [{
          start: {line: (replace ? len - 1 : len), character: 0},
          end: {line: len + lines.length, character: 0}
        }])
        if (workspace.isVim) nvim.command('redraw', true)
      } catch (e) {
        window.showErrorMessage(e.message)
      }
      release()
    })
    t.onStdout(async (lines: any) => {
      let release = await mutex.acquire()
      try {
        await appendLines(lines)
        if (workspace.isVim) nvim.command('redraw', true)
      } catch (e) {
        window.showErrorMessage(e.message)
      }
      release()
    })
  }

  const execute = async () => {
    let doc = await workspace.document
    let program = (programMap as any)[doc.filetype]
    if (!program) {
      window.showErrorMessage(`filetype not supported`)
      return
    }
    await executeFile(doc, true)
  }
  context.subscriptions.push(workspace.onDidSaveTextDocument(async (e: { uri: any }) => {
    let doc = workspace.getDocument(e.uri)
    await executeFile(doc, false)
  }))

  context.subscriptions.push({
    dispose: () => {
      for (let task of (taskMap as any).values()) {
        task.dispose()
      }
    }
  })

  context.subscriptions.push(
    commands.registerCommand('execute.currentFile', execute)
  )
}
