call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'

call plug#end()


"********************************
" Config
"********************************

autocmd BufWritePre *.js Neoformat


let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}



let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 1 " replace the file, instead of updating buffer (default: 0),
            \ 'stdin': 1, " send data to stdin of formatter (default: 0)
            \ 'env': ["DEBUG=1"], " prepend environment variables to formatter command
            \ 'valid_exit_codes': [0, 23],
            \ 'no_append': 1,
            \ }

let g:neoformat_enabled_python = ['autopep8']