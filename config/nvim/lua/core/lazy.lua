local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
require("lazy").setup({{ import = "plugins" },
	spec = {
	  
	  { import = "plugins.lsp" },
	  { import = "plugins.editor" },
	  { import = "plugins.ui" },
	},
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = true,
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { 'onedark' },
	  },
	  rtp = {
		reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
		---@type string[]
		paths = {}, -- add any custom paths here that you want to incluce in the rtp
		---@type string[] list any plugins you want to disable here
		disabled_plugins = {
		  "matchit",
		  "netrw",
		  "netrwPlugin",
		  "netrwSettings",
		  "netrwFileHandlers",
		  "gzip",
		  "zip",
		  "zipPlugin",
		  "tar",
		  "tarPlugin",
		  "getscript",
		  "getscriptPlugin",
		  "vimball",
		  "vimballPlugin",
		  "2html_plugin",
		  "logipat",
		  "rrhelper",
		  "matchparen"
		},
  })

