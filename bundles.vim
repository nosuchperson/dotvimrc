set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax
Plugin 'scrooloose/syntastic'


" Golang
Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode'



" IDE features
Plugin 'scrooloose/nerdtree' " Nerdtree -> file treeview
Plugin 'Xuyuanp/nerdtree-git-plugin' " Nerdtree plugin -> for git
Plugin 'majutsushi/tagbar' " Tagbar -> show taginfo
Plugin 'kien/ctrlp.vim' " CtrlP

" Color 
Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline'


" EasyMontion -> ACEJUMP VIM
Plugin 'easymotion/vim-easymotion'


Plugin 'ycm-core/YouCompleteMe'


Plugin 'puremourning/vimspector'



" End of this config
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
