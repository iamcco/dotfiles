# greeting text
set fish_greeting \> Too Young Too Simple, Sometimes Naive \<

# JAVA and android
switch (uname)
case Darwin
    set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home
    if test -d "$JAVA_HOME"
        set CLASS_PATH $JAVA_HOME/lib/dt.jar $JAVA_HOME/lib/tools.jar
        set -gx PATH $JAVA_HOME/bin $PATH
    end

    # android sdk
    set -gx ANDROID_HOME $HOME/Library/Android/sdk
    if test -d  "$ANDROID_HOME"
        set -gx PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $PATH
    end
end

# rustup
set CARGO_HOME $HOME/.cargo
if test -d "$CARGO_HOME"
    set -gx PATH $CARGO_HOME/bin $PATH
end

# fish proxy
set proxy_host 127.0.0.1:49501
set proxy_auth false

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME'/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source $HOME'/google-cloud-sdk/path.fish.inc'; else; . $HOME'/google-cloud-sdk/path.fish.inc'; end; end

# pj plugin
set -gx PROJECT_PATHS ~/workspace/pxn ~/.configrc
