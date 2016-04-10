#!/usr/bin/env bash

SCRIPT_PATH=${0%\/*}
cd $SCRIPT_PATH
SCRIPT_PATH=$PWD
BACKUP_DIR="$HOME/backup_`date +%Y-%m-%d_%H-%M-%S`"

# color
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

mkdir_backup() {
    mkdir "$BACKUP_DIR"
    printf "make directory $CYAN$BACKUP_DIR$NC\n"
}

mk_symlink() {
    if [ ! $1 ]
    then
        printf "$RED mk_symlink need a name $NC\n"
    else
        local TARGET=$SCRIPT_PATH/$1
        local LINKTO=$HOME/.$1
        if [ -e "$TARGET" ]
        then
            if [ -e $LINKTO -o -L $LINKTO ]
            then
                if [ ! -d $BACKUP_DIR ]; then mkdir_backup; fi
                mv "$LINKTO" "$BACKUP_DIR/"
                printf "backup $CYAN$LINKTO$NC -> $CYAN$BACKUP_DIR$NC\n"
            fi
            ln -s "$TARGET" "$LINKTO"
            printf "linked $CYAN$TARGET$NC -> $CYAN$LINKTO$NC\n"
        else
            printf "file $RED$TARGET$NC is not exists\n"
        fi
    fi
}


for ITEM in config eslintrc gitconfig tern-project tmux.conf zshrc bin
do
    mk_symlink $ITEM
done

