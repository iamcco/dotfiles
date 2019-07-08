const { workspace, FloatFactory } = require('coc.nvim')

exports.activate = context => {
  let { subscriptions } = context
  let config = workspace.getConfiguration('coc-status')
  let enable = config.get('enable', true)

  if (!enable) {
    return
  }

  const f = new FloatFactory(workspace.nvim, workspace.env)
  let timer
  let cocStatus = ''

  subscriptions.push(f)
  subscriptions.push(
    workspace.registerAutocmd({
      event: ['User', 'CocStatusChange'],
      request: false,
      callback: async () => {
        const newStatus = await workspace.nvim.getVar('coc_status')
        if (cocStatus !== newStatus) {
          cocStatus = (newStatus || '').trim()
          if (cocStatus !== '') {
            clearTimeout(timer)
            f.create([{
              filetype: 'coc-status',
              content: cocStatus
            }], false)
            timer = setTimeout(() => {
              f.close()
            }, 500)
          }
        }
      }
    })
  )
}
