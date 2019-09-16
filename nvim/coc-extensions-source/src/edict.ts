import { ExtensionContext, workspace, languages } from 'coc.nvim';
import { Hover, MarkupKind } from 'vscode-languageserver-types'
import { join } from 'path';
import { existsSync, mkdirSync, createReadStream } from 'fs';
import readline from 'readline';

import { download } from './lib/download';

const ecdictName = 'ecdict.csv'
const ecdictUrl = 'https://raw.githubusercontent.com/skywind3000/ECDICT/master/ecdict.csv'

const ecdictData = new Map()

function edictInit(ecdictPath: string) {
  if (existsSync(ecdictPath)) {
    readline.createInterface({
      input: createReadStream(ecdictPath),
      terminal: false
    }).on('line', (line: string) => {
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

function getWordByIndex (word: string, idx: number) {
  while (/[-_]/.test(word[idx])) {
    idx += 1
  }
  if (idx == word.length) {
    idx -= 1
    while (/[-_]/.test(word[idx])) {
      idx -= 1
    }
  }
  if (idx < 0) {
    return ''
  }
  let start = idx
  let end = idx + 1
  while (start > 0) {
    if (/[A-Z]/.test(word[start])) {
      start = start
      break
    } else if (/[-_]/.test(word[start])) {
      start += 1
      break
    }
    start -= 1
  }
  while (end < word.length) {
    if (/[A-Z_-]/.test(word[end])) {
      end -= 1
      break
    }
    end += 1
  }
  return word.slice(start, end + 1)
}

function formatDoc (word: string, words: Record<string, string>) {
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
  return values
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
    edictInit(ecdictPath)
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
          const wordRange = doc.getWordRangeAtPosition(position, '-_')
          if (!wordRange) {
            return null
          }
          let wordText = document.getText(wordRange) || ''
          let word = wordText
          if (!word) {
            return null
          }
          let words = ecdictData.get(word.toLowerCase())
          if (!words) {
            word = wordText.replace(/((\B[A-Z])|-+|_+)/g, ' $2')
            words = ecdictData.get(word.toLowerCase())
          }
          if (!words) {
            word = getWordByIndex(wordText, position.character - wordRange.start.character)
            words = ecdictData.get(word.toLowerCase())
            workspace.showMessage(`${word}-${words}`)
          }
          if (!words) {
            return null
          }
          const values = formatDoc(word, words)
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
