#!/bin/bash
#github.com/spf13/spf13-vim

path=`pwd`

######################
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

lnif() {
    if [ -e "$1" ]; then
        ln -s "$1" "$2"
    fi
    ret="$?"
}

program_exists() {
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
        error "$2"
    fi
}

clone_vundle() {
    if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
        git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
    else
        upgrade_repo "vundle"   "Successfully updated vundle"
    fi
    ret="$?"
    success "$1"
}

create_symlinks() {
    lnif "$path/_astylerc"            "$HOME/.astylerc"
    lnif "$path/_vimrc"               "$HOME/.vimrc"
    lnif "$path/_git-prompt.sh"       "$HOME/.git-prompt.sh"
    lnif "$path/_bashrc"              "$HOME/.bashrc.sh"

    echo "source .bashrc.sh" >> "$HOME/.bashrc"
    ret="$?"
    success "$1"
}

clone_vundle() {
    if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
        git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
    fi
    ret = "$?"
    success "$1"
}

setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'
    vim -u "$HOME/.vimrc" +BundleInstall! +BundleClean +qall 
    export SHELL="$system_shell"

    success "$1"
}


####################### MAIN()
program_exists "vim" "Install Vim first"

create_symlinks "Setting up symlinks"

clone_vundle    "cloned vundle"

setup_vundle    "install vundle"

msg             "success"
