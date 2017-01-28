#!/usr/bin/env bash

# insure that script is completed
promise() {
    # color
    color_fg_red='\033[31m'
    color_fg_green='\033[32m'
    color_fg_blue='\033[34m'
    color_fg_aoi='\033[36m'
    color_end='\033[0m'
    # config constant
    repo_url='https://github.com/iamcco/dotfiles.git'
    config_name='.configrc'
    path_to_config_dir="$HOME/$config_name"
    backup_dir="$HOME/backup_`date +%Y-%m-%d_%H-%M-%S`"
    # requirement
    requirement="git"

    # red
    msg_red() {
        echo -en "${color_fg_red}$1${color_end}"
    }

    # green
    msg_green() {
        echo -en "${color_fg_green}$1${color_end}"
    }

    # aoi
    msg_aoi() {
        echo -en "${color_fg_aoi}$1${color_end}"
    }

    # blue
    msg_blue() {
        echo -en "${color_fg_blue}$1${color_end}"
    }

    # title
    msg_title() {
        echo -en "\n========"; msg_aoi " $1 "; echo "========"
    }

    # check for requirement
    check_required() {
        msg_title "check for requirement"
        idx=1
        for command in $requirement
        do
            echo -en "${idx}. "; msg_blue $command

            if type $command > /dev/null 2>&1
            then
                msg_green " √\n"
            else
                msg_red " ✘\n"
                msg_red "\n${command} is required\n"
                return 1
            fi
            ((idx++))
        done
        return 0
    }

    # create backup dir
    mkdir_backup() {
        echo -n "create backup dir: "; msg_aoi "${backup_dir}"
        if mkdir "${backup_dir}" > /dev/null 2>&1
        then
            msg_green " √\n"
        else
            msg_red " ✘\n"
            exit 1
        fi
    }

    # clone git repo
    clone_repo() {
        msg_aoi "clone ${repo_url}\n"
        if git clone "${repo_url}" "${path_to_config_dir}"
        then
            return 0
        fi
        return 1
    }

    check_repo() {
        echo -n "check "; msg_aoi "${path_to_config_dir}:"
        if [ -e $path_to_config_dir ]
        then
            msg_green " √\n"
            return 0
        else
            msg_red " ✘\n"
            if clone_repo
            then
                return 0
            else
                return 1
            fi
        fi
    }

    # link
    mk_symlink() {
        if [ -e "$1" ]
        then
            # check dotfile is exists
            if [ -e $2 -o -L $2 ]
            then
                # create backup dir if not exists
                if [ ! -d $backup_dir ]; then mkdir_backup; fi
                # backup dotfile
                echo -n "mv "; msg_aoi "${2}"; echo -n " to "; msg_aoi "${backup_dir}: "
                if mv "$2" "$backup_dir/" > /dev/null 2>&1
                then
                    msg_green "√\n"
                else
                    msg_red "✘\n"
                fi
            fi
            echo -n "link "; msg_aoi "${1}"; echo -n " to "; msg_aoi "${2}"
            if ln -s "$1" "$2" > /dev/null 2>&1
            then
                msg_green " √\n"
            else
                msg_red " ✘\n"
            fi
        else
            echo -n "file "; msg_aoi "${1}"; msg_red " is not exists\n"
        fi
    }

    install_dotfiles() {
        msg_aoi "install dotfiles:\n"
        local path_to_dotfiles="${path_to_config_dir}/dotfiles"
        ls "${path_to_dotfiles}" | while read item
        do
            mk_symlink "${path_to_dotfiles}/${item}" "${HOME}/.${item}"
        done
        msg_aoi "install dotfiles:"; msg_green " DONE\n"
    }

    install_neovim_config() {
        msg_aoi "install neovim config:\n"
        local path_to_nvim="${HOME}/.config/nvim"
        echo -n "check "; msg_aoi "${path_to_nvim}"
        if [ -e $path_to_nvim ]
        then
            msg_green " √\n"
        else
            msg_red " ✘\n"
            echo -n "mkdir directory "; msg_aoi "${path_to_nvim}\n"
            if mkdir -p "${path_to_nvim}" > /dev/null 2>&1
            then
                msg_green " √\n"
            else
                msg_red " ✘\n"
                exit 1
            fi
        fi
        mk_symlink "${path_to_config_dir/neovim/init.vim}" "${path_to_nvim}/init.vim"
        msg_aoi "install neovim ocnfig:"; msg_green " DONE\n"
    }

    install_all() {
        install_dotfiles
        install_neovim_config
    }

    # show menu
    show_menu() {
        msg_title "INSTALL"
        echo "1) install neovim config"
        echo "2) install dotfiles"
        echo "3) install neovim config and dotfiles"
        echo -n "select: "
        read num
        case $num in
            1) check_repo && install_neovim_config ;;
            2) check_repo && install_dotfiles ;;
            3) check_repo && install_all ;;
            *) echo "Goodbye :)" ;;
        esac
    }

    show_menu
}

promise

# vim:set ft=sh:
