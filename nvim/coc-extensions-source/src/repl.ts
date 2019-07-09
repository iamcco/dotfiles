import { commands, workspace, ExtensionContext, Terminal } from 'coc.nvim'

export function activate(context: ExtensionContext) {
  let { nvim } = workspace
  let terminal: Terminal
  context.subscriptions.push(commands.registerCommand('repl.openTerminal', async () => {
    let filetype = await nvim.eval('&filetype')
    let prog = ''
    if (filetype === 'javascript') {
      prog = 'node'
    } else if (filetype === 'typescript') {
      prog = 'ts-node'
    } else if (filetype === 'python') {
      prog = 'python'
    }
    terminal = await workspace.createTerminal({
      name: prog || 'terminal'
    })
    if (prog) {
      terminal.sendText(prog, true)
    }
  }))
  context.subscriptions.push(commands.registerCommand('repl.showTerminal', async () => {
    if (terminal) {
      terminal.show()
    }
  }))
  context.subscriptions.push(commands.registerCommand('repl.disposeTerminal', async () => {
    if (terminal) {
      terminal.dispose()
    }
  }))
  context.subscriptions.push(workspace.registerKeymap(['x'], 'repl-sendtext', async () => {
    await nvim.call('eval', 'feedkeys("\\<esc>", "in")')
    let doc = workspace.getDocument(workspace.bufnr)
    if (!doc) return
    let visualmode = await nvim.call('visualmode')
    let range = await workspace.getSelectedRange(visualmode, doc)
    if (!range) return
    let text = doc.textDocument.getText(range)
    if (text && terminal) terminal.sendText(text, true)
  }, { sync: false, silent: true }))
}
