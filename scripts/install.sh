#!/bin/sh

OS=linux
ARCH=amd64
GOLANG_VERSION=1.12.5
GOLANG_ARCHIVE_NAME=go$GOLANG_VERSION.$OS-$ARCH.tar.gz
install_env() {
    printf "Installing environment ...\n"
    sudo apt-get install -y build-essential git vim ack-grep exuberant-ctags curl wget cmake python3-dev
    printf "Downloading Golang ... \n"
    curl -O https://dl.google.com/go/$GOLANG_ARCHIVE_NAME
    printf "Installing Golang ... \n"
    sudo tar -C /usr/local -xzf $GOLANG_ARCHIVE_NAME
    if [ -f ~/.zshrc ]; then
        echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
    fi
    if [ -f ~/.bashrc ]; then
        echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    fi
    export PATH=$PATH:/usr/local/go/bin
    rm -f $GOLANG_ARCHIVE_NAME
}


main() {
    set -e

    printf "Backup vim\n"

    if [ -d ~/.vim ] ; then
	if [ -d ~/.vim.orig ]; then
	    rm -rf ~/.vim.orig
	fi
        env mv ~/.vim ~/.vim.orig
    fi

    if [ -f ~/.vimrc ]; then
	if [ -f ~/.vimrc.orig ]; then
	    rm -rf ~/.vimrc.orig
	fi
        env mv ~/.vimrc ~/.vimrc.orig
    fi 


    printf "Cloning dotvimrc ...\n"
    env git clone --depth=1 https://github.com/PandaShare/dotvimrc.git ~/.vim || {
        printf "Error: git clone of PandaShare/dotvimrc repo failed !\n"
        exit 1
    }


    printf "Cloning Vundle ...\n"
    env git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || {
        printf "Error: git clone of VundleVim/Vundle repo failed !\n"
        exit 1
    }


    printf "Installing plugins ... \n"
    if [ -f ~/.vimrc ] ; then
        env rm -f ~/.vimrc
    fi
    env ln -b -s ~/.vim/vimrc ~/.vimrc

    env vim +BundleInstall || {
        printf "Error: vim +BundleInstall failed !\n"
        exit 1
    }

    env vim +GoInstallBinaries || {
        printf "Error: vim +GoBinariesInstall failed !\n"
        exit 1
    }

    printf "Installing YouCompleteMe ... \n"
    env python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --go-completer 



}

install_env
main

