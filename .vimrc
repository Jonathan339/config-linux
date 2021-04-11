" Mostrar número de línea
set number
set mouse=a
set numberwidth=1
" Muestra líena debajo del cursor.
set cursorline
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
" Muestra la pareja de [] {} y ()
set showmatch
set sw=2
set relativenumber
set laststatus=2
set lines=40 columns=145

set runtimepath^=~/.vim runtimepath^=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc


so ~/.vim/colors/monokai.vim
so ~/.vim/plugins.vim
so ~/.vim/maps.vim
so ~/.vim/plugin-config.vim
