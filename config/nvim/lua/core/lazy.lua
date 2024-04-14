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
	default = {
		lazy = true,
	},
	checker = { enabled = true, notify = false },
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
