-- Cargar el módulo Vim global
local global = vim

-- Definir los líderes de los mapas de teclas
global.g.mapleader = ','
global.g.maplocalleader = ','

-- Modo insertar
global.keymap.set('i', ",,", "<ESC>")

-- Guardar el archivo actual
global.keymap.set('i', "<Leader>w", "<ESC>:w!<cr>")

-- Salir del editor
global.keymap.set('n', "<Leader>q", ":q!<cr>")

-- Instalar plugins con Packer
global.keymap.set('n', "<Leader>i", ":PackerInstall<cr>")

-- Buscar archivos con FZF
global.keymap.set('n', "<Leader>f", ":FZF<cr>")

-- Buscar archivos en el proyecto con Telescope
global.keymap.set('n', "<Leader>b", ":Telescope git_files hidden=true<CR>")

-- Buscar texto en el proyecto con Telescope
global.keymap.set('n', "<Leader>l", ":Telescope live_grep<CR>")

-- Abrir el árbol de archivos con NERDTree
global.keymap.set('n', "<Leader>m", ":NERDTree<CR>")

-- Ejecutar código con SnipRun
global.keymap.set('n', "<Leader>n", ":SnipRun<CR>")

-- Habilitar el autocompletado inteligente
global.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
global.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Asignaciones de teclas para pickers de Telescope
global.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
global.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
global.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
