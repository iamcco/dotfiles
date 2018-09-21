# JAVA
switch (uname)
case Darwin
    set JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home
    if test -d "$JAVA_HOME"
        set CLASS_PATH $JAVA_HOME/lib/dt.jar $JAVA_HOME/lib/tools.jar
        set -x PATH $JAVA_HOME/bin $PATH
    end

    # android sdk
    set ANDROID_HOME $HOME/Library/Android/sdk
    if test -d  "$ANDROID_HOME"
        set -x PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $PATH
    end
end

# pyenv
set PYENV_ROOT $HOME/.pyenv
if test -d $PYENV_ROOT/shims
    set -x PATH $PYENV_ROOT/shims $PATH
end
if test -d $PYENV_ROOT/bin
    set -x PATH $PYENV_ROOT/bin $PATH
end

# rustup
set CARGO_HOME $HOME/.cargo
if test -d "$CARGO_HOME"
    set -x PATH $CARGO_HOME/bin $PATH
end

if which thefuck
    set thefuckalias (thefuck --alias)
    eval $thefuckalias
    set -e thefuckalias
end
