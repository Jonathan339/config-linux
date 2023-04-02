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

" Guardar
nmap <Leader>w :w!<cr>

"Guardar y salir
nmap <Leader>q :wq<cr>
"node
nmap <Leader>n :!node %<cr>

"actualizar el archivo
nmap <Leader>r :so %<cr>

nmap <Leader>v :VirtualEnvActivate<cr>
" Saltar al final de la línea
inoremap <C-e> <C-o>$

