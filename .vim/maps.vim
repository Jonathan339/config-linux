" Keymaps
" =====================================

" Abrir terminal
map <F2> :belowright terminal<CR>

" Auto_save 
let g:auto_save=1

" Tecla lider
let g:mapleader = ","

" Busca archivos con fzf
noremap <leader>fs :Files<cr>

" Modo Normal
imap ,, <Esc>

" Formateo de sintaxis (javascript)
nmap <Leader>f :Neoformat<cr>

" Abrir NerdTree
nmap <Leader>nt :NERDTree<CR>
map <C-n> :NERDTreeToggle<CR>

" easymotion busqueda
nmap <Leader>s <Plug>(easymotion-s2)

" Guardar
nmap <Leader>w :w<cr>

" Salir
nmap <Leader>q :q<cr>

nmap <Leader>v :VirtualEnvActivate<cr>
" Saltar al final de la línea
inoremap <C-e> <C-o>$

