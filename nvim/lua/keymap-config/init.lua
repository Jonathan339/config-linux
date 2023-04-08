-- Cargar el módulo Vim global
local g = vim.g

-- Definir los líderes de los mapas de teclas
g.mapleader = ','
g.maplocalleader = ','

-- Modo insertar
vim.api.nvim_set_keymap('i', ',,', '<ESC>', {noremap = true})

-- Guardar el archivo actual
vim.api.nvim_set_keymap('i', '<Leader>w', '<ESC>:w!<cr>', {noremap = true})

-- Salir del editor
vim.api.nvim_set_keymap('n', '<Leader>q', ':q!<cr>', {noremap = true})

-- Instalar plugins con Packer
vim.api.nvim_set_keymap('n', '<Leader>i', ':PackerInstall<cr>', {noremap = true})

-- Buscar archivos con FZF
vim.api.nvim_set_keymap('n', '<Leader>f', ':FZF<cr>', {noremap = true})

-- Buscar archivos en el proyecto con Telescope
vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope git_files hidden=true<CR>', {noremap = true})

-- Buscar texto en el proyecto con Telescope
vim.api.nvim_set_keymap('n', '<Leader>l', ':Telescope live_grep<CR>', {noremap = true})

-- Abrir el árbol de archivos con NERDTree
vim.api.nvim_set_keymap('n', '<Leader>m', ':NERDTree<CR>', {noremap = true})

-- Ejecutar código con SnipRun
vim.api.nvim_set_keymap('n', '<Leader>n', ':SnipRun<CR>', {noremap = true})

-- Asignaciones de teclas para pickers de Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", {noremap = true})

-- Mapear las teclas de navegación para el autocompletado
vim.api.nvim_set_keymap('i', '<C-n>', 'coc#refresh()<CR>', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-p>', 'coc#refresh()<CR>', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<C-h>"', {silent = true, expr = true})
