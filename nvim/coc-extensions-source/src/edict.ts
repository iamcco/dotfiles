import { ExtensionContext, workspace, languages } from 'coc.nvim';
import { Hover, MarkupKind } from 'vscode-languageserver-types'
import { join } from 'path';
import { existsSync, readFileSync, mkdirSync } from 'fs';
import { download } from './lib/download';

const ecdictName = 'ecdict.csv'
const ecdictUrl = 'https://raw.githubusercontent.com/skywind3000/ECDICT/master/ecdict.csv'

const ecdictData = new Map()

function edictInit(ecdictPath: string) {
  if (existsSync(ecdictPath)) {
    const content = readFileSync(ecdictPath).toString().split('\n')
    content.forEach(line => {
      const items = line.split(',')
      ecdictData.set(items[0].toLowerCase(), {
        phonetic: items[1] || '',
        definition: items[2] || '',
        translation: items[3] || '',
        pos: items[4] || ''
      })
    })
  }
}

export async function activate(context: ExtensionContext): Promise<void> {
  const ecdictPath = join(context.storagePath, ecdictName)
  if (!existsSync(context.storagePath)) {
    mkdirSync(context.storagePath)
  }
  if (!existsSync(ecdictPath)) {
    await download(ecdictPath, ecdictUrl, 'edict')
    edictInit(ecdictPath)
  } else {
    setTimeout(() => {
      edictInit(ecdictPath)
    }, 0);
  }

  context.subscriptions.push(
    languages.registerHoverProvider(
      ['*'],
      {
        provideHover(document, position): Hover | null {
          const doc = workspace.getDocument(document.uri)
          if (!doc) {
            return null
          }
          const wordRange = doc.getWordRangeAtPosition(position)
          if (!wordRange) {
            return null
          }
          const word = (document.getText(wordRange) || '').toLowerCase()
          if (!word || !ecdictData.has(word)) {
            return null
          }
          const words = ecdictData.get(word)
          let values = [
            `**${word}**`,
          ]
          if (words.phonetic) {
            values = values.concat([
              '',
              `**音标：**${words.phonetic}`,
            ])
          }
          if (words.definition) {
            values = values.concat([
              '',
              '**英文解释：**',
              '',
              ...words.definition.split('\\n').map((line: string) => line.replace(/^"/, '')),
            ])
          }
          if (words.translation) {
            values = values.concat([
              '',
              '**中文解释：**',
              '',
              ...words.translation.split('\\n').map((line: string) => line.replace(/^"/, '')),
            ])
          }
          if (words.pos) {
            values = values.concat([
              '',
              `**词语位置：**${words.pos.replace(/\n/, ' ')}`
            ])
          }
          return {
            contents: {
              kind: MarkupKind.Markdown,
              value: values.join('\n')
            }
          }
        }
      }
    )
  )
}
