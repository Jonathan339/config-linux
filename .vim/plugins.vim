"  Plugins
" ====================

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" virtualenv     
Plug 'jmcantrell/vim-virtualenv'

" Temas
Plug 'morhetz/gruvbox'
" IDE
Plug 'easymotion/vim-easymotion'

" Auto Save
Plug '907th/vim-auto-save'

" moverse entre archivos 
Plug 'christoomey/vim-tmux-navigator'

" directorio de archivos
Plug 'scrooloose/nerdtree'

" vistas de modos en la barra inferior|
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" prettier
Plug 'sbdchd/neoformat'

" autocompletado
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


