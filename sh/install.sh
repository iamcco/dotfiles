#!/usr/bin/env bash

echo "$NC apt-get update $NC"
sudo apt-get update

install_git() {
    # install git
    echo "install git \n"
    sudo apt-get install git

    # clone the dotfiles
    echo "$NC clone dotfiles $NC"
    git clone https://github.com/iamcco/dotfiles.git ~/dotfiles

}

install_git

# consts
cd ~/dotfiles
SCRIPT_PATH=`pwd`
BACKUP_DIR="$HOME/backup_`date +%Y-%m-%d_%H-%M-%S`"

# color
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# install softwares
source $SCRIPT_PATH/sh/softwares
# link dotfiles
source $SCRIPT_PATH/sh/dotfiles

# vim:set ft=sh:
