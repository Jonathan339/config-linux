-- Habilitar el soporte para sintaxis de lenguaje
vim.o.syntax = 'on'

-- Ocultar archivos abiertos al salir de Vim
vim.o.hidden = true

-- Dividir la ventana en la dirección adecuada al abrir una nueva ventana
vim.o.splitright = true

-- Resaltar la línea actual
vim.o.cursorline = true

-- Mostrar los números de línea
vim.o.number = true

-- Reemplazar las pestañas con espacios
vim.o.expandtab = true

-- Establecer el tamaño de las pestañas
vim.o.softtabstop = 2

-- Establecer el ancho de las pestañas
vim.o.shiftwidth = 2

-- Habilitar la autoindentación inteligente
vim.o.smartindent = true

-- Deshabilitar el ajuste automático de líneas
vim.o.wrap = false

-- Resaltar el paréntesis correspondiente
vim.o.showmatch = true

-- Establecer la búsqueda sin distinción entre mayúsculas y minúsculas
vim.o.ignorecase = true

-- Establecer la búsqueda con distinción entre mayúsculas y minúsculas si no todas las letras son minúsculas
vim.o.smartcase = true

-- Visualización de reemplazo en vivo
vim.o.inccommand = "split"

-- Habilitar el uso del mouse en Vim
vim.o.mouse = "a"

-- Usar el portapapeles del sistema operativo
vim.o.clipboard = "unnamedplus"

-- Deshabilitar la creación de archivos de copia de seguridad
vim.o.backup = false

-- Deshabilitar las campanas de error
vim.o.errorbells = false

-- Deshabilitar la creación de archivos de intercambio
vim.o.swapfile = false

-- Mostrar la columna de signos siempre
vim.o.signcolumn = "yes"

-- No utilizar un tipo de buffer específico
vim.o.buftype = ""

-- Configuración de opciones de complementación
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_trigger_character = {'.'}

-- Configuración adicional
-- Configuración del tema de color
vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')
vim.o.runtimepath = vim.o.runtimepath .. ',~/.local/share/nvim/site/'
