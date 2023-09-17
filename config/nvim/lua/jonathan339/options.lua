vim.cmd("autocmd!")

-- Codificación y manejo de archivos
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

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

-- Pestañas y espacios
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Búsqueda
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- Configuración adicional
vim.opt.cursorline = false
--vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkwait100-blinkon0-blinkoff0"
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
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.modifiable = true
vim.cmd([[autocmd BufWinEnter * setlocal modifiable]])

-- Autocompletado
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_trigger_character = {'.'}

-- Virtualenv para Python
vim.g.virtualenv_python = 'python3'
vim.cmd([[autocmd FileType python autocmd BufReadPost,BufNewFile * VirtualEnvActivate]])

-- Resaltar el texto copiado
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]
