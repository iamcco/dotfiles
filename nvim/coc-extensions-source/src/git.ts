import {ExtensionContext, commands, workspace, extensions, Disposable} from "coc.nvim";
import { ExtensionApi } from 'coc-git-p';
import {join} from "path";
import {writeFileSync, readFileSync, existsSync} from "fs";

const GIT_EXTENSION = 'coc-git-p'
const GIT_COMMIT = 'git.commit'

export async function activate(context: ExtensionContext) {
  // get git-p extension
  const gitExt = extensions.getExtension(GIT_EXTENSION)
  if (!gitExt) {
    return workspace.showMessage(`${GIT_EXTENSION} required!`)
  }
  const gitApi = await gitExt.extension.activate() as ExtensionApi
  if (!gitApi) {
    return workspace.showMessage(`Ensure ${GIT_EXTENSION} is working!`)
  }

  let subscription: Disposable[] = []
  const sub = Disposable.create(() => {
    if (subscription && subscription.length) {
      subscription.forEach(item => {
        item.dispose()
      })
      subscription = []
    }
  })
  context.subscriptions.push(sub)

  commands.titles.set(GIT_COMMIT, 'Git commit')
  context.subscriptions.push(Disposable.create(() => {
    commands.titles.delete(GIT_COMMIT)
  }))
  context.subscriptions.push(
    commands.registerCommand(GIT_COMMIT, async () => {
      const nvim = workspace.nvim
      const doc = await workspace.document
      const repo = await gitApi.manager.getRepo(doc.bufnr)
      const [conflicted, staged] = await repo.getStaged()
      if (conflicted !== 0) {
        return workspace.showMessage('Please resolve Conflict first!')
      }
      if (staged === 0) {
        return workspace.showMessage('Nothing to commit!')
      }
      // get diff to head
      const gitDiff = await repo.exec(['--no-pager', 'diff', 'head'])
      // get current git status
      const gitStatus = await repo.exec(['--no-pager', 'status'])

      nvim.pauseNotification()
      // open new tab
      nvim.command('tabnew', true)
      // create diff buffer
      nvim.command(`edit +setl\\ buftype=nofile git://diff`, true)
      nvim.command('setl foldmethod=syntax nobuflisted noswapfile bufhidden=wipe', true)
      nvim.command('setf git', true)
      nvim.call('append', [0, gitDiff.stdout.split('\n').slice(0,-1)], true)
      nvim.command('normal! zi', true)
      nvim.command(`exe 1`, true)
      // create commit buffer
      nvim.command(`vsplit git://commit`, true)
      nvim.command('setl nobuflisted noswapfile bufhidden=wipe', true)
      nvim.command('setf gitcommit', true)
      nvim.call('append', [1, gitStatus.stdout.split('\n').map(line => `# ${line}`).slice(0,-1)], true)
      nvim.command(`exe 1`, true)
      nvim.command(`startinsert`, true)
      nvim.command(`setl nomodified`, true)
      await nvim.resumeNotification(false, false)

      // update commit
      const commitEditMsg = join(repo.root, '.git', 'COMMIT_EDITMSG')
      writeFileSync(commitEditMsg, [''].concat(gitStatus.stdout.split('\n').map(line => `# ${line}`)).slice(0, -1).join('\n'))

      subscription.push(
        workspace.registerAutocmd({
          event: 'WinClosed',
          request: false,
          callback: async () => {
            // unregister autocmd
            sub.dispose()
            // close tab
            await nvim.command('tabclose')
            // get commit message from repo/.git/COMMIT_EDITMSG
            const commitEditMsg = join(repo.root, '.git', 'COMMIT_EDITMSG')
            if (!existsSync(commitEditMsg)) {
              return
            }
            const commitMsg = readFileSync(commitEditMsg)
              .toString()
              .split('\n')
              .filter(line => !line.startsWith('#'))
              .join('\n')
            if (commitMsg.trim() !== '') {
              const statusItem = workspace.createStatusBarItem(0, { progress: true })
              subscription.push(statusItem)
              statusItem.text = 'git'
              statusItem.show()
              try {
                const commitRes = await repo.exec(
                  ['commit', '-F', '-'],
                  {
                    input: commitMsg
                  }
                )
                if (commitRes.exitCode !== 0) {
                  workspace.showMessage(commitRes.stderr, 'error')
                } else {
                  workspace.showMessage(commitRes.stdout.split('\n')[0])
                }
              } catch (error) {
                workspace.showMessage(`Commit fail: ${error.message || error}`, 'error')
              } finally {
                statusItem.hide()
                statusItem.dispose()
              }
            }
          }
        }),
        workspace.registerAutocmd({
          event: 'BufWriteCmd',
          request: true,
          callback: async () => {
            // set buffer nomodified
            await nvim.command('setl nomodified')
            const buf = await nvim.buffer
            // save commit message to repo/.git/COMMIT_EDITMSG
            const lines = await buf.getLines({ start: 0, end: -1, strictIndexing: true })
            const commitEditMsg = join(repo.root, '.git', 'COMMIT_EDITMSG')
            writeFileSync(commitEditMsg, lines.join('\n'))
          }
        })
      )
    })
  )
}
