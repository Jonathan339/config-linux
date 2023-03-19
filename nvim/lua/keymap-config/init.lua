local global vim = vim

vim.g.mapleader = ','
vim.g.maplocalleader = ','
-- Modo normal
vim.keymap.set('i', ",,", "<ESC>")
-- Salir
vim.keymap.set('n', "<Leader>q", ":wq!<cr>")
-- Guardar
vim.keymap.set('i', "<Leader>w", "<ESC>:w!<cr>")
-- install
vim.keymap.set('n', "<Leader>i", ":PackerInstall<cr>")
-- FZF
vim.keymap.set('n', "<Leader>f", ":FZF<cr>")
-- telescope
--nmap <C-P> :Telescope git_files hidden=true <CR>
--nmap <C-T> :Telescope live_grep <CR>
vim.keymap.set('n',"<Leader>b", ":Telescope git_files hidden=true <CR>")
vim.keymap.set('n',"<Leader>l", ":Telescope live_grep <CR>")
--
vim.keymap.set('n',"<Leader>r", ":Runcode<CR>")
vim.keymap.set('n',"<Leader>m", ":NERDTree<CR>")

vim.keymap.set('n',"<Leader>n", ":SnipRun<CR>")
