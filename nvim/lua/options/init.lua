
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.number = true
--vim.opt.title = true
-- Indentation
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
-- highlight matching parenthesis
vim.opt.showmatch = true
-- set case insensitive searching
vim.opt.ignorecase = true
-- case sensitive searching when not all lowercase
vim.opt.smartcase = true
-- Live replacing using %sFZFxt/newText
vim.opt.inccommand = "split"
vim.opt.mouse = "a"
-- use native clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.swapfile = false
-- Always show signcolumns
vim.opt.signcolumn = "yes"
--
vim.opt.buftype = ""
--if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then 
    -- buffer is a terminal
--end

-- notify
vim.notify = require("notify")
-- theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- reload config 
--vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})
--vim.cmd.ReloadConfig()
