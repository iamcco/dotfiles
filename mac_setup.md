# overtheword

- [install lantern](https://github.com/getlantern/download/wiki)
- install chrome

# finder

- https://github.com/lexrus/LTFinderButtons

# hammerspoon

- http://www.hammerspoon.org

# package manager

- install [ brew ](https://brew.sh)
- `brew install the_silver_searcher`
- `brew install homebrew/cask/spectacle`
- `brew install asciinema`
- `brew install watchman`
- `brew install fzy`
- `brew install bat`
- `brew install diff-so-fancy`
  > config: https://github.com/so-fancy/diff-so-fancy
  ```bash
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

  git config --global color.diff-highlight.oldNormal    "red bold"
  git config --global color.diff-highlight.oldHighlight "red bold 52"
  git config --global color.diff-highlight.newNormal    "green bold"
  git config --global color.diff-highlight.newHighlight "green bold 22"

  git config --global color.diff.meta       "yellow"
  git config --global color.diff.frag       "magenta bold"
  git config --global color.diff.commit     "yellow bold"
  git config --global color.diff.old        "red bold"
  git config --global color.diff.new        "green bold"
  git config --global color.diff.whitespace "red reverse"
  ```
- `brew tap jesseduffield/lazygit`
- `brew install lazygit`

# terminal

- install iterm2: `brew install homebrew/cask/iterm2`
- 配置 iterm2 终端颜色
- 安装字体
- 导入 iterm2 配置

# edit

- install neovim: `brew install neovim`
- [instal dotfiles](https://github.com/iamcco/dotfiles)

# python

- `brew install pyenv`
- `pyenv install --list`
- `pyenv install 3.7.0`
- `pyenv install 2.7.15`
- `pyenv global 2.7.15 3.7.0`
- `pip3 install neovim`
- `pip install neovim`

# node

- install node：`brew install node`
- `yarn global add fx`
- `yarn global add neovim`
- `yarn global add bash-language-server`
- `yarn global add tslint`
- `yarn global add http-server`
- `yarn global add cnpm`
  > `npm config set prefix ~/.config/npm`
  > `npm config set cache ~/.config/npm/cache`
- `npm install -g eslint`
- `npm install -g eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node`
- `npm install -g stylelint-config-standard`

# fish
- 安装fisher
`curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher`

- install fish：`brew install fish`
  > `vim /etc/shells`
  > add `/usr/local/bin/fish`
  > `chsh -s /usr/local/bin/fish`
- `fisher i hasanozgan/theme-lambda`
- `fisher i omf/pj`
- `fisher i omf/osx`
- `fisher i omf/proxy`
- `pip3 install thefuck`
- `fisher i omf/thefuck`
- `fisher i omf/hash`
- `fihser i omf/gi`
- `gi update-completions`

# ruby

- `gem install solargraph`
- `:CocInstall coc-solargraph`

# flutter

- ~/sdk/flutter
- https://flutter.io/setup-macos/
- `pub global activate dart_language_server`
