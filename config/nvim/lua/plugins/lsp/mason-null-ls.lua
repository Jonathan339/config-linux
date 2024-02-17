return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	event = "VeryLazy",
	config = function()
		local mason_null = require("mason-null-ls")
		-- See mason-null-ls.nvim's documentation for more details:
		-- https://github.com/jay-babu/mason-null-ls.nvim#setup
		mason_null.setup({
			ensure_installed = nil,
			automatic_installation = true, -- You can still set this to `true`
			automatic_setup = true,
			handlers = {},
			--
		})
		-- Required when `automatic_setup` is true
		-- require("mason-null-ls").setup_handlers()-- require your null-ls config here (example below)
	end,
}
