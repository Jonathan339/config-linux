local vim = vim

-- Definir los líderes de los mapas de teclas
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Modo normal
vim.keymap.set('i', ",,", "<ESC>")

-- Guardar
vim.keymap.set('i', "<Leader>w", "<ESC>:w!<cr>")

-- Instalar plugins con Packer
vim.keymap.set('n', "<Leader>i", ":PackerInstall<cr>")

-- Buscar archivos con FZF
vim.keymap.set('n', "<Leader>f", ":FZF<cr>")

-- Buscar archivos en el proyecto con Telescope
vim.keymap.set('n', "<Leader>b", ":Telescope git_files hidden=true<CR>")
-- Buscar texto en el proyecto con Telescope
vim.keymap.set('n', "<Leader>l", ":Telescope live_grep<CR>")

-- Abrir el árbol de archivos con NERDTree
vim.keymap.set('n', "<Leader>m", ":NERDTree<CR>")

-- Ejecutar código con SnipRun
vim.keymap.set('n', "<Leader>n", ":SnipRun<CR>")
