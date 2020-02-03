import {ExtensionContext, workspace, extensions } from "coc.nvim";
import { ExtensionApi } from 'coc-git-p';

import { activate as activateCommit } from './lib/git/commit';
import { activate as activatePush } from './lib/git/push';

const GIT_EXTENSION = 'coc-git-p'

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
  activateCommit(context, gitApi)
  activatePush(context, gitApi)
}
