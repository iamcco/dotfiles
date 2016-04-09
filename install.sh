#!/usr/bin/env bash

PWDDIR=$PWD
BACKUPDIR="$HOME/backup_`date +%Y-%m-%d_%H-%M-%S`"

# color
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No color

mkdir_backup() {
    mkdir "$BACKUPDIR"
    printf "make directory $BLUE$BACKUPDIR$NC\n"
}

mk_symlink() {
    if [ ! $1 ]
    then
        printf "$RED mk_symlink need a name $NC\n"
    else
        local TARGET=$PWDDIR/$1
        local LINKTO=$HOME/.$1
        if [ -e "$TARGET" ]
        then
            if [ -e $LINKTO ]
            then
                if [ ! -d $BACKUPDIR ]; then mkdir_backup; fi
                mv "$LINKTO" "$BACKUPDIR/"
                printf "backup $BLUE$LINKTO$NC -> $BLUE$BACKUPDIR$NC\n"
            fi
            ln -s "$TARGET" "$LINKTO"
            printf "linked $BLUE$TARGET$NC -> $BLUE$LINKTO$NC\n"
        else
            printf "file $RED$TARGET$NC is not exists\n"
        fi
    fi
}


for ITEM in config eslintrc gitconfig tern-project tmux.conf zshrc
do
    mk_symlink $ITEM
done
