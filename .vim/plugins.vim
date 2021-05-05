"*****************************************************************************
"  Plugins
"*****************************************************************************

call plug#begin('~/.vim/plugged')
" virtualenv
Plug 'sansyrox/vim-python-virtualenv'
"Plug 'miyakogi/vim-virtualenv'
Plug 'jmcantrell/vim-virtualenv'

"****************************************
"vim-visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"*********************************
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  

"*****************************************************************************
" Temas
"*****************************************************************************
"Plug 'morhetz/gruvbox'
"Plug 'shinchu/lightline-gruvbox.vim'
"Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim' 

"*****************************************************************************
" IDE
"*****************************************************************************
Plug 'easymotion/vim-easymotion'


"*****************************************************************************
" Emmet
"*****************************************************************************

Plug 'mattn/emmet-vim'

"*****************************************************************************
" Auto Save
"*****************************************************************************

Plug '907th/vim-auto-save'

"*****************************************************************************
" moverse entre archivos
"*****************************************************************************

Plug 'christoomey/vim-tmux-navigator'

"*****************************************************************************
" directorio de archivos
"*****************************************************************************

Plug 'scrooloose/nerdtree'

"*****************************************************************************
" vistas de modos en la barra inferior
"*****************************************************************************
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"*****************************************************************************
" status bar
"*****************************************************************************
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'


"*****************************************************************************
" prettier
"*****************************************************************************
Plug 'sbdchd/neoformat'


"*****************************************************************************
" autocompletado
"*****************************************************************************

"Plug 'valloric/youcompleteme'

call plug#end()


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



