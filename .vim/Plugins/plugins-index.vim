.vim/Plugins/virtualenv/vim-python-virtualenv.vim
.vim/Plugins/vim-visual-multi/vim-visual-multi.vim
.vim/Plugins/fzf/fzf.vim
.vim/Plugins/gruvbox/gruvbox.vim
.vim/Plugins/ayu-theme/ayu-theme.vim
.vim/Plugins/emmet/emmet.vim
.vim/Plugins/vim-auto-save/vim-auto-save.vim
.vim/Plugins/vim-easymotion/vim-easymotion.vim
.vim/Plugins/vim-tmux-navigator/vim-tmux-navigator.vim
.vim/Plugins/nerdtree/nerdtree.vim
.vim/Plugins/vim-airline/vim-airline.vim
.vim/Plugins/lightline-ale/lightline-ale.vim
.vim/Plugins/neoformat/neoformat.vim
.vim/Plugins/vim-jsx-pretty/vim-jsx-pretty.vim
.vim/Plugins/vim-es2015-snippets/vim-es2015-snippets.vim
.vim/Plugins/fzf-coc/fzf-coc.vim

"*********************************************************************

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
