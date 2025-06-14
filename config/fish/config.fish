# greeting text
set fish_greeting \> (curl --max-time 3 --silent https://v1.jinrishici.com/rensheng.txt) \<

# .local
if test -d "$HOME/.local/bin"
    set -gx PATH $HOME/.local/bin $PATH
end

switch (uname)
case Darwin
    # JAVA and android
    set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
    if test -d "$JAVA_HOME"
        set -gx CLASS_PATH $JAVA_HOME/lib/dt.jar $JAVA_HOME/lib/tools.jar
        set -gx PATH $JAVA_HOME/bin $PATH
    end
    # android sdk
    set -gx ANDROID_HOME $HOME/Library/Android/sdk
    if test -d  "$ANDROID_HOME"
        set -gx PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools/emulator $PATH
    end

    # brew
    set -gx HOMEBREW_NO_AUTO_UPDATE true
    set -gx HOMEBREW_NO_ANALYTICS 1
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

# npm
set -gx NPM_HOME $HOME/.config/npm
if test -d "$NPM_HOME/bin"
    set -gx PATH $NPM_HOME/bin $PATH
end

# yarn
if test -d "$HOME/.yarn/bin"
    set -gx PATH $HOME/.yarn/bin $PATH
end

set -gx DENO_INSTALL $HOME/.deno
if test -d "$DENO_INSTALL/bin"
    set -gx PATH $DENO_INSTALL/bin $PATH
end

# rustup
set -gx CARGO_HOME $HOME/.cargo
if test -d "$CARGO_HOME"
    set -gx PATH $CARGO_HOME/bin $PATH
end
set -gx RUSTUP_DIST_SERVER "https://rsproxy.cn"
set -gx export RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"

# flutter
set FLUTTER_HOME $HOME/sdk/flutter
if test -d "$FLUTTER_HOME/bin"
    set -gx PATH $FLUTTER_HOME/bin $PATH
    set -gx PUB_HOSTED_URL https://pub.flutter-io.cn
    set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
end
if test -d "$FLUTTER_HOME/bin/cache/dart-sdk/bin"
    set -gx PATH $FLUTTER_HOME/bin/cache/dart-sdk/bin $PATH
end
if test -d "$HOME/.pub-cache/bin"
    set -gx PATH $HOME/.pub-cache/bin $PATH
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME'/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source $HOME'/google-cloud-sdk/path.fish.inc'; else; . $HOME'/google-cloud-sdk/path.fish.inc'; end; end

# rbenv
if test -d "$HOME/.rbenv/shims"
    set -gx PATH $HOME/.rbenv/shims $PATH
end

# go
set -x -U GOPATH $HOME/go
if test -d "$GOPATH"
    set -gx PATH $GOPATH/bin $PATH
end

# zoxide
if which zoxide &> /dev/null
    zoxide init fish | source
end

# alias
abbr -a ssk kitty +kitten ssh

abbr -a ghs gh copilot suggest

# git alias
abbr -a gdrt git push origin :refs/tags/
abbr -a gdt git tag -d

# custom neovim build
set -x -U NEOVIM_PATH $HOME/neovim
if test -d "$NEOVIM_PATH"
    set -gx PATH $NEOVIM_PATH/bin $PATH
end

# n
# nodejs manager
set -x N_PREFIX "$HOME/n"; contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# DEVKITPRO
set -gx DEVKITPRO /opt/devkitpro
set -gx DEVKITARM /opt/devkitpro/devkitARM
set -gx DEVKITA64 /opt/devkitpro/devkitA64
set -gx PATH $DEVKITPRO/tools/bin $PATH
set -gx PATH $DEVKITARM/bin $PATH
set -gx PATH $DEVKITA64/bin $PATH

# PSP
set -gx PSPDEV $HOME/pspdev
set -gx PATH $PSPDEV/bin $PATH

# VITASDK
set -gx VITASDK $HOME/vitasdk
set -gx PATH $VITASDK/bin $PATH

# Python3
set -gx PATH $HOME/Library/Python/3.9/bin $PATH

# key mapping
# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
function fish_default_mode_prompt
    # disabled vim mode indicator
end

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# kitty theme according to system theme
switch (uname)
case Darwin
  function system_theme -d "Get system theme"
      defaults read "Apple Global Domain" AppleInterfaceStyle &> /dev/null; and echo "Dark"; or echo "Light"
  end

  function toggle_theme -d "Toggle theme"
      osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
  end

  function trigger_neovim -d "Trigger neovim to update theme"
      for pid in (pgrep nvim)
          kill -SIGUSR1 $pid
      end
  end

  function dark -d "Set dark theme"
    if [ $THEME = "Dark" ]
        return
    end
    set -xU THEME "Dark"
    kitty +kitten themes --reload-in=all onedark
    git config --global delta.light false
    if [ (system_theme) = "Light" ]
        toggle_theme
    end
    trigger_neovim
  end

  function light -d "Set light theme"
    if [ $THEME = "Light" ]
        return
    end
    set -xU THEME "Light"
    kitty +kitten themes --reload-in=all onelight
    git config --global delta.light true
    if [ (system_theme) = "Dark" ]
        toggle_theme
    end
    trigger_neovim
  end

  if [ (system_theme) = "Dark" ]
      dark
  else
      light
  end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
