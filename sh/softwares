#!/usr/bin/env bash

# change cwd to scripts directory
echo "$NC change cwd to $SCRIPT_PATH $NC"
cd $SCRIPT_PATH

install_neovim() {
    # install neovim
    echo "$NC install neovim $NC"
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
    sudo apt-get install xclip
    sudo apt-get install python-pip python3-pip python-dev python-pip python3-dev python3-pip
    pip instal neovim
    pip3 install neovim
}

install_oh_my_zsh() {
    # install zsh and setup oh_my_zsh
    echo "$NC install zsh and setup oh_my_zsh $NC"
    sudo apt-get install zsh
    chsh -s /bin/zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_nodejs() {
    # install nodejs v4.x
    echo "$NC install nodejs v4.x $NC"
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    sudo apt-get install -y nodejs

    # installl global nodejs package
    cat "$SCRIPT_PATH/sh/nodejs_global_package.txt" | while read node_package_name
    do
        echo "$NC install $node_package_name $NC"
        sudo npm install -g $node_package_name
    done
}

install_chrome() {
    # install chrome
    echo "$NC install chrome $NC"
    sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install google-chrome-stable
}

install_fonts() {
    # install Fantasque sans font
    echo "$NC install Fantasque sans font $NC"
    cd "$SCRIPT_PATH/dotfiles/fonts-backup"
    unzip "$SCRIPT_PATH/fonts-backup/Fantasque-sans-fonts.zip"
    mkdir ~/.fonts
    mv "$SCRIPT_PATH/fonts-backup/fontsBackup/FantasqueSansMono-patcher" ~/.fonts/FantasqueSansMono
    cd ~/.fonts/FantasqueSansMono
    mkfontdir
    mkfontscale
    fc-cache -fv
    cd $SCRIPT_PATH
}

install_neovim
install_oh_my_zsh
install_nodejs
install_chrome
install_fonts

# vim:set ft=sh:
