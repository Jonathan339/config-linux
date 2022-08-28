" Mostrar número de línea
set number
set completeopt=menu,menuone,noselect "-- mostly just for cmp
set mouse=a
set numberwidth=1
" Muestra líena debajo del cursor.
set cursorline
set clipboard=unnamedplus
syntax enable
set showcmd
set ruler
set encoding=utf-8
" Muestra la pareja de [] {} y ()
set showmatch
set sw=2
set relativenumber
set laststatus=2
set title
highlight Normal ctermbg=NONE
set noshowmode
set termguicolors     " enable true colors support
syntax enable

so ~/.vim/plugins.vim
so ~/.vim/maps.vim


"*****************************************************************************
" python intergration
"*****************************************************************************

let g:python3_host_prog='/usr/bin/python3'
"let g:python3_host_prog=$HOME.'/.venv/bin/python3'

"*****************************************************************************
" Configuracion del tema
"*****************************************************************************

"gruvbox config
colorscheme gruvbox
"colorscheme ayu
