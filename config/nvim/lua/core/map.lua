-- Definir los líderes de los mapas de teclas
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Función para definir los mapas de teclas con programación asíncrona
local function nmap(mode, keys, command, desc)
  if not desc then
    desc = 'Sin descripción'
  end

  vim.api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true, nowait = true, desc = desc })
end
-- Salir de modo insertar
nmap('i', ',,', '<ESC>', 'Salir de modo insertar')

-- Guardar el archivo actual
nmap('n', '<Leader>w', ':w!<CR>', 'Guardar el archivo actual')

-- Salir del editor
nmap('n', '<Leader>q', ':q!<CR>', 'Salir del editor')

-- Buscar archivos con Telescope
nmap('n', '<Leader>f', ':Telescope find_files<CR>', 'Buscar archivos con Telescope')

-- Buscar buffers con Telescope
nmap('n', '<Leader>b', ':Telescope buffers<CR>', 'Buscar buffers con Telescope')

-- Ayuda con Telescope
nmap('n', '<Leader>h', ':Telescope help_tags<CR>', 'Ayuda con Telescope')

-- Buscar palabras con Telescope
nmap('n', '<Leader>l', ':Telescope live_grep<CR>', 'Buscar palabras con Telescope')

-- Abrir NERDTree
--nmap('n', '<Leader>c', ':NERDTreeToggle<CR>', 'Abrir NERDTree')

-- Terminal con ToggleTerm
nmap('n', '<Leader>t', ':ToggleTerm direction=float<CR>', 'Terminal con ToggleTerm')

-- Configuración de LSP (Language Server Protocol)

-- Mapeos para LSP
nmap('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<CR>', 'Cambiar nombre con LSP')
nmap('n', '<Leader>ca', ':lua vim.lsp.buf.code_action()<CR>', 'Acciones de código con LSP')
nmap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', 'Ir a definición con LSP')
nmap('n', 'gr', ':lua require("telescope.builtin").lsp_references()<CR>', 'Referencias con LSP')
nmap('n', 'gI', ':lua require("telescope.builtin").lsp_implementations()<CR>', 'Implementaciones con LSP')
nmap('n', '<Leader>D', ':lua vim.lsp.buf.type_definition()<CR>', 'Definición de tipo con LSP')
nmap('n', '<Leader>ds', ':lua require("telescope.builtin").lsp_document_symbols()<CR>', 'Símbolos de documento con LSP')
nmap('n', '<Leader>ws', ':lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', 'Símbolos de espacio de trabajo con LSP')

-- Ver documentación con K y Ctrl-K
nmap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', 'Documentación emergente con LSP')
nmap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', 'Ayuda de firma con LSP')

-- Funcionalidad menos utilizada de LSP
nmap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', 'Ir a declaración con LSP')
nmap('n', '<Leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', 'Agregar carpeta de espacio de trabajo con LSP')
nmap('n', '<Leader>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Eliminar carpeta de espacio de trabajo con LSP')
nmap('n', '<Leader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'Listar carpetas de espacio de trabajo con LSP')

-- Crear un comando `:Format` local para el buffer LSP
nmap('n', '<Leader>F', ':lua vim.lsp.buf.formatting()<CR>', 'Formatear el buffer actual con LSP')
