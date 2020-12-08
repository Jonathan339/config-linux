" Comfiguracion del tema
colorscheme gruvbox 
let g:gruvbox_contrast_dark = "hard"
set bg=dark



autocmd vimenter * colorscheme gruvbox

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif