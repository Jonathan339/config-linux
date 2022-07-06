call plug#begin('~/.vim/plugged')
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

"********************************
" Config
"********************************

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_template_tags = ['html', 'jsx']