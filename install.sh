#!/usr/bin/env bash

# consts
SCRIPT_PATH=${0%\/*}
cd $SCRIPT_PATH
SCRIPT_PATH=$PWD
BACKUP_DIR="$HOME/backup_`date +%Y-%m-%d_%H-%M-%S`"

# color
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# install softwares
source $SCRIPT_PATH/sh/softwares
# link dotfiles
source $SCRIPT_PATH/sh/setup_dotfiles

# vim:set ft=sh:
