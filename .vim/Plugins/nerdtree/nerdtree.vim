call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
call plug#end()

"********************************
" Config
"********************************

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif