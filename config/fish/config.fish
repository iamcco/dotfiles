# greeting text
set fish_greeting \> (curl --max-time 3 --silent https://v1.jinrishici.com/rensheng.txt) \<

# JAVA and android
switch (uname)
case Darwin
    set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
    if test -d "$JAVA_HOME"
        set CLASS_PATH $JAVA_HOME/lib/dt.jar $JAVA_HOME/lib/tools.jar
        set -gx PATH $JAVA_HOME/bin $PATH
    end

    # android sdk
    set -gx ANDROID_HOME $HOME/Library/Android/sdk
    if test -d  "$ANDROID_HOME"
        set -gx PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools/emulator $PATH
    end
end

# npm
set NPM_HOME $HOME/.config/npm
if test -d "$NPM_HOME/bin"
    set -gx PATH $NPM_HOME/bin $PATH
end

# rustup
set CARGO_HOME $HOME/.cargo
if test -d "$CARGO_HOME"
    set -gx PATH $CARGO_HOME/bin $PATH
end

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

# pj plugin
set -gx PROJECT_PATHS ~/ ~/workspace/pxn ~/development

# rbenv
if test -d "$HOME/.rbenv/shims"
    set -gx PATH $HOME/.rbenv/shims $PATH
end

# go
set -x -U GOPATH $HOME/go
if test -d "$GOPATH"
    set -gx PATH $GOPATH/bin $PATH
end

# DEVKITPRO
set -gx DEVKITPRO /opt/devkitpro

# lovepotion
set -x -U LOVEPOTION $HOME/.config/lovebrew/bin
if test -d "$LOVEPOTION"
    set -gx PATH $LOVEPOTION $PATH
end

# zoxide
if test -f (which zoxide)
    zoxide init fish | source
end

# brew
set -gx HOMEBREW_NO_AUTO_UPDATE true

# alias
abbr -a ssk kitty +kitten ssh

# custom neovim build
set -x -U NEOVIM_PATH $HOME/neovim
if test -d "$NEOVIM_PATH"
    set -gx PATH $NEOVIM_PATH/bin $PATH
end
