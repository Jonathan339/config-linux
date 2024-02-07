require('autocommands')


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
-- Add lazy.nvim to the runtime path.
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
-- Require lazy.nvim and call the setup() function.
require("lazy").setup({
	-- Import the plugins and plugin groups from the plugins directory.
	{ import = "plugins" },
	-- Specify the plugins to be lazy-loaded.
	spec = {
		{ import = "plugins.lsp" },
		{ import = "plugins.editor" },
		{ import = "plugins.ui" },
	},

	-- Install missing plugins on startup.
	install = {
		missing = true,
		colorscheme = { "onedark" },
	},

	-- Check for plugin updates automatically.
	checker = {
		enabled = false,
		concurrency = 1,
		notify = true,
		frequency = 3600,
	},

	-- Enable change detection for plugins.
	change_detection = {
		enabled = true,
		notify = true,
	},

	-- Enable performance optimizations.
	performance = {
		cache = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/lazy/cache",
			disable_events = { "VimEnter", "BufReadPre" },
			ttl = 3600 * 24,
		},
		reset_packpath = true,
		rtp = {
			reset = true,
			disabled_plugins = {
				"matchit",
				--  "netrw",
				-- "netrwPlugin",
				--  "netrwSettings",
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
				-- "2html_plugin",
				"logipat",
				"rrhelper",
				"matchparen",
			},
		},
	},
})
