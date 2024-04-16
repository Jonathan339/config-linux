local map = require('utils').map

-- Salir del modo insertar
map('i', ',,', '<ESC>', { desc = 'Salir del modo insertar' })

-- Guardar el archivo actual
map('n', '<Leader>w', ':w!<CR>', { desc = 'Guardar el archivo actual' })

map('n', '<Leader>e', ':Ex<CR>', { desc = 'Salir del editor' })
-- Navigate buffers
-- map('n', '<C-Right>', ':bnext<CR>', { desc = 'Saltar al siguiente buffer' })
-- map('n', '<C-Left>', ':bprevious<CR>', { desc = 'Saltar al buffer anterior' })
map('n', '<A-Right>', ':bnext<CR>', { desc = 'Saltar al siguiente buffer' })
map('n', '<A-Left>', ':bprevious<CR>', { desc = 'Saltar al buffer anterior' })
-- Select all
--
map('n', '<C-a>', 'ggVG', { desc = 'Seleccionar todo' })

map('n', '<C-s>', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Buscar en el buffer actual' })

-- Salir del editor
map('n', '<Leader>q', ':q!<CR>', { desc = 'Salir del editor' })

-- Ejecutar el archivo actual
map('n', '<Leader>m', ':RunCode<CR>', { desc = 'Salir del editor' })

-- Buscar archivos con Telescope
map('n', '<Leader>f', ':Telescope find_files<CR>', { desc = 'Buscar archivos con Telescope' })

-- Buscar buffers con Telescope
map('n', '<Leader>b', ':Telescope buffers<CR>', { desc = 'Buscar buffers con Telescope' })

-- Ayuda con Telescope
map('n', '<Leader>h', ':Telescope help_tags<CR>', { desc = 'Ayuda con Telescope' })

-- Buscar palabras con Telescope
map('n', '<Leader>l', ':Telescope live_grep<CR>', { desc = 'Buscar palabras con Telescope' })
