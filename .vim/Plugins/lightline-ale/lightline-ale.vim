call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'       " Dependency: linter
Plug 'itchyny/lightline.vim'    " Dependency: status line
Plug 'maximbaz/lightline-ale'

call plug#end()


"********************************
" Config
"********************************

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"