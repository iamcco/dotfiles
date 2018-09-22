# pyenv
set PYENV_ROOT $HOME/.pyenv
if test -d $PYENV_ROOT/shims
    set -gx PATH $PYENV_ROOT/shims $PATH
end
if test -d $PYENV_ROOT/bin
    set -gx PATH $PYENV_ROOT/bin $PATH
end
