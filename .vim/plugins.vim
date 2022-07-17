call plug#begin('~/.vim/plugged')
" emmet
Plug 'mattn/emmet-vim'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"fzf-coc
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
"gruvbox
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
"ale
Plug 'dense-analysis/ale'       " Dependency: linter
Plug 'itchyny/lightline.vim'    " Dependency: status line
Plug 'maximbaz/lightline-ale'
"neoformat
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
"nerdtree
Plug 'scrooloose/nerdtree'
"vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"vim-auto-save
Plug '907th/vim-auto-save'
"--------
" ES2015 code snippets
Plug 'epilande/vim-es2015-snippets'
" React code snippets (Optional)
Plug 'epilande/vim-react-snippets'
" Ultisnips
Plug 'SirVer/ultisnips'
"------
" vim-jsx-pretty
Plug 'maxmellon/vim-jsx-pretty'
"vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'
"vim-visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()
"gruvbox
let g:gruvbox_contrast_dark = "hard"
"ale
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

"Neoformat
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

"NERDTree
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"auto_save
let g:auto_save = 1  " enable AutoSave on Vim startup

"UltiSnips
let g:UltiSnipsExpandTrigger="<C-l>"

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_template_tags = ['html', 'jsx']


" Automatically install the plugin manager itself if it's not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl
				\ --fail
				\ --location
				\ --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
				\ --output
				\ ~/.vim/autoload/plug.vim

	augroup VimPlugAutomaticSelfInstallation
		autocmd!
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup END
endif

" Automatically install missing plugins.
augroup VimPlugAutomaticPluginInstallation
	autocmd!
	autocmd VimEnter *
				\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
				\	PlugInstall --sync | q |
				\ endif
augroup END
