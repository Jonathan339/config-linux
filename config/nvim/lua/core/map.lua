local mapa = require("utils").map

-- Salir del modo insertar
mapa("i", ",,", "<ESC>", { desc = "Salir del modo insertar" })

-- Guardar el archivo actual
mapa("n", "<Leader>w", ":w!<CR>", { desc = "Guardar el archivo actual" })

mapa("n", "<Leader>e", ":Ex<CR>", { desc = "Salir del editor" })

-- Salir del editor
mapa("n", "<Leader>q", ":q!<CR>", { desc = "Salir del editor" })

-- Ejecutar el archivo actual
mapa("n", "<Leader>m", ":RunCode<CR>", { desc = "Salir del editor" })

-- Buscar archivos con Telescope
mapa("n", "<Leader>f", ":Telescope find_files<CR>", { desc = "Buscar archivos con Telescope" })

-- Buscar buffers con Telescope
mapa("n", "<Leader>b", ":Telescope buffers<CR>", { desc = "Buscar buffers con Telescope" })

-- Ayuda con Telescope
mapa("n", "<Leader>h", ":Telescope help_tags<CR>", { desc = "Ayuda con Telescope" })

-- Buscar palabras con Telescope
mapa("n", "<Leader>l", ":Telescope live_grep<CR>", { desc = "Buscar palabras con Telescope" })
