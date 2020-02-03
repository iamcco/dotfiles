import {ExtensionContext, workspace, commands, Disposable, StatusBarItem} from "coc.nvim"
import {ExtensionApi} from "coc-git-p"
import {IExecutionResult} from "coc-git-p/lib/git"

const GIT_PUSH = 'git.push'

export async function activate(context: ExtensionContext, gitApi: ExtensionApi) {
  let statusItem: StatusBarItem | undefined
  commands.titles.set(GIT_PUSH, 'Git push')

  context.subscriptions.push(
    Disposable.create(() => {
      commands.titles.delete(GIT_PUSH)
      if (statusItem) {
        statusItem.dispose()
      }
    }),
    commands.registerCommand(GIT_PUSH, async (...args: any[]) => {
      const nvim = workspace.nvim
      const buf = await nvim.buffer
      if (!buf) {
        return
      }
      const repo = await gitApi.manager.getRepo()
      if (!repo) {
        return
      }
      statusItem = workspace.createStatusBarItem(0, { progress: true })
      statusItem.text = 'push'
      statusItem.show()
      try {
        let pushRes: IExecutionResult<string>
        const head = await repo.getHEAD()
        const origins = (await repo.exec(['remote', 'show'])).stdout.trim().split('\n')
        const remoteBranches = (await repo.exec(['branch', '-r', '--no-color'])).stdout.trim().split('\n')
        if (remoteBranches.some(branch => {
          return origins.some(origin => branch.trim() === `${origin}/${head}`)
        })) {
          pushRes = await repo.exec(['push', ...args])
        } else {
          const res = await workspace.requestInput(`git push --set-upstream ${origins[0]} ${head} y/n`)
          if (res && res.toLowerCase() === 'y') {
            pushRes = await repo.exec(['push', '--set-upstream', origins[0], head])
          } else {
            workspace.showMessage('Push cancelled')
          }
        }
        if (pushRes! && pushRes!.exitCode === 0) {
          workspace.showMessage(`Git push success`)
        }
      } catch (error) {
        workspace.showMessage(`Git push fail: ${error.message || error}`)
      } finally {
        statusItem.hide()
        statusItem.dispose()
        statusItem = undefined
      }
    })
  )
}
