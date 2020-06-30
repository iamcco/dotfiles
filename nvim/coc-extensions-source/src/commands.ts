import { ExtensionContext, workspace, commands } from 'coc.nvim'

export async function activate(context: ExtensionContext): Promise<void> {
  context.subscriptions.push(
    commands.registerCommand('jsdo', async (...args: string[]) => {
      const doc = await workspace.document
      const buffer = doc.buffer
      if (!buffer) {
        return
      }
      if (args.length === 0) {
        const cmd = await workspace.requestInput('jsdo(l,ln) =>')
        if ((cmd || '').trim() === '') {
          return
        }
        args.push(cmd)
      }
      const lines = await buffer.getLines()
      const fn = Function('l', 'ln', `return ${args.join(' ').trim().replace(/^return/, '')}`)
      // vim line start from 1
      const newLines = lines.map((line, lineNumber) => fn(line, lineNumber + 1))
      buffer.replace(newLines, 0)
    })
  )
}
