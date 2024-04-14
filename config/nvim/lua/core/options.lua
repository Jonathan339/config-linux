-- Definir los líderes de los mapas de teclas

local opt = vim.opt
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.g.snippets = pcall(require, "luasnip")
-- [[Auto completado]]

opt.completeopt = "menu,menuone,noselect"
opt.shortmess = opt.shortmess + { c = true }
opt.wildmode = "longest:full,full"
-- [[Configuración de la interfaz de usuario]]

opt.conceallevel = 2
opt.cursorline = true
opt.list = false
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
-- perfomance

opt.redrawtime = 1500
opt.timeoutlen = 200
opt.ttimeoutlen = 10
opt.updatetime = 100
-- [[Configuración del texto]]

opt.backspace = { "eol", "start", "indent" }
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.expandtab = true
opt.ignorecase = true
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.modifiable = true -- Permite modificar el contenido del buffer
opt.shiftround = true
opt.shiftwidth = 2
opt.smartcase = true
opt.smartindent = true
opt.syntax = "enable"
opt.tabstop = 2
opt.virtualedit = "block"
opt.wildignore:append({ "*/node_modules/*" })
-- [[Guardado y deshacer]]

opt.autoread = true
opt.autowrite = true
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
-- [[Vista previa y navegación]]

opt.inccommand = "nosplit"
opt.laststatus = 3
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.winminwidth = 5
vim.opt.foldenable = false
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
