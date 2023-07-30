-- Configuración de codificación y manejo de archivos
vim.cmd("autocmd!")
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

-- Configuración de la interfaz
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Configuración de pestañas y espacios
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Configuración de búsqueda
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- Configuración adicional
vim.o.syntax = 'on'
vim.opt.cursorline = false
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkwait100-blinkon0-blinkoff0"
vim.opt.showmatch = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.buftype = ""
vim.opt.wildmenu = true
vim.opt.winblend = 0
vim.opt.completeopt = 'menu'
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

-- Configuración de autocompletado
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_trigger_character = {'.'}

-- Configuración de tema de color
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.cmd('colorscheme gruvbox')
vim.o.runtimepath = vim.o.runtimepath .. ',~/.local/share/nvim/site/'

-- Virtualenv para Python
vim.g.virtualenv_python = 'python3'  -- Cambiar a la ruta correcta de tu ejecutable de Python
vim.cmd([[autocmd FileType python autocmd BufReadPost,BufNewFile * VirtualEnvActivate]])

-- Resaltar el texto copiado durante 200 ms usando el grupo de resaltado "Visual"
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]

-- Función de recarga de configuración
function ReloadConfig()
    vim.cmd("source ~/.config/nvim/init.vim")
    print("Configuración recargada.")
end
