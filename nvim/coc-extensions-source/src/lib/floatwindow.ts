import { Neovim, Window, Buffer as NVIMBuffer } from 'coc.nvim';
import { Subject, Subscription, from, timer } from 'rxjs';
import { concatMap, switchMap, scan, filter, map } from 'rxjs/operators';

export class FloatWindow {
  private source$: Subject<string> = new Subject<string>()
  private subscription: Subscription
  private buf: NVIMBuffer | undefined
  private win: Window | undefined

  constructor(
    private nvim: Neovim,
    private maxWidth: number,
    private delayGap: number
  ) {
    this.subscription = this.source$.pipe(
      scan((acc, content) => {
        const { preContent } = acc;
        const pass = preContent !== content
        return {
          pass,
          preContent: content
        }
      }, { preContent: '', pass: true }),
      filter(res => res.pass && res.preContent !== ''),
      map(res => res.preContent),
      concatMap(content => {
        return from(this.update(content))
      }),
      switchMap(() => {
        return timer(this.delayGap)
      }),
    ).subscribe(() => {
      this.close()
    })
  }

  private getHeight(content: string): number {
    let l = 0
    let lines = content.split(/\r?\n/)
    for (let line of lines) {
      l = l + Math.max(1, Math.ceil(Buffer.byteLength(line) / (this.maxWidth + 2)))
    }
    return l
  }

  private async getWinConfig (content: string): Promise<any> {
    const col = await this.nvim.getOption('columns') as number
    const height = this.getHeight(content)
    const width = Math.min(this.maxWidth, Buffer.byteLength(content) + 2)

    return {
      focusable: false,
      relative: 'editor',
      anchor: 'NE',
      height,
      width,
      row: 7,
      col
    }
  }

  private async createBuffer() {
    if (this.buf) {
      const isValid = await this.buf.valid
      if (isValid) {
        return
      }
    }
    this.buf = await this.nvim.createNewBuffer(false, true)
  }

  private async createWindow(content: string): Promise<boolean> {
    if (this.win) {
      const isValid = await this.win.valid
      if (isValid) {
        return false
      }
    }

    const winConfig = await this.getWinConfig(content)

    const win = await this.nvim.openFloatWindow(
      this.buf!,
      false,
      winConfig
    )
    this.win = win

    this.nvim.pauseNotification()
    await win.setOption('number', false)
    await win.setOption('wrap', true)
    await win.setOption('relativenumber', false)
    await win.setOption('cursorline', false)
    await win.setOption('cursorcolumn', false)
    await win.setOption('conceallevel', 2)
    await win.setOption('signcolumn', 'no')
    await win.setOption('foldcolumn', 1)
    await win.setOption('winhighlight', 'FoldColumn:NormalFloat')
    await this.nvim.resumeNotification()
    return true
  }

  private async update (content: string) {

    await this.createBuffer()

    await this.buf!.setLines(content, { start: 0, end: -1 })

    const isNewWin = await this.createWindow(content)

    const { win } = this

    if (!isNewWin) {
      const winConfig = await this.getWinConfig(content)

      this.nvim.call('nvim_win_set_config', [
        win!.id,
        winConfig
      ])
    }
  }

  public show(content: string) {
    this.source$.next(content)
  }

  public async close() {
    const { win } = this
    this.win = undefined
    if (win) {
      const isValid = await win.valid
      if (isValid) {
        await win.close(true)
      }
    }
  }

  public async dispose() {
    if (this.subscription) {
      this.subscription.unsubscribe()
    }
    await this.close()
  }
}
