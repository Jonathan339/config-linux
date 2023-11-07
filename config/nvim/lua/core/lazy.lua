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
	  ui = {
		size = { width = 0.8, height = 0.8 },
		border = 'none',
		icons = {
		  loaded = '●',
		  not_loaded = '○',
		  cmd = ' ',
		  config = '',
		  event = '',
		  ft = ' ',
		  init = ' ',
		  keys = ' ',
		  plugin = ' ',
		  runtime = ' ',
		  source = ' ',
		  start = '',
		  task = '✔ ',
		  lazy = '鈴 ',
		  list = {
			'●',
			'➜',
			'★',
			'‒',
		  },
		},
	  },
	  diff = { cmd = 'diffview.nvim' },
	  checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	  },
	  change_detection = {
		enabled = true,
		notify = true, -- get a notification when changes are found
	  },
	  performance = {
		cache = {
		  enabled = true,
		  path = vim.fn.stdpath('cache') .. '/lazy/cache',
		  disable_events = { 'VimEnter', 'BufReadPre' },
		  ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
		},
		reset_packpath = true, -- reset the package path to improve startup time
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
			-- "2html_plugin",
			"logipat",
			"rrhelper",
			"matchparen"
		  },
		},
	  },
  })

