local user_config = require("config.user")
local u = require("utils")
return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local ls = require("luasnip")
		ls.config.set_config(u.merge({
			history = true,
			-- Update more often, :h events for more info.
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		}, user_config.plugins.luasnip or {}))

		-- extend html snippets to react files
		require("luasnip").filetype_extend("javascriptreact", { "html" })
		require("luasnip").filetype_extend("typescriptreact", { "html" })

		-- load snippets (friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Función para cargar los snippets
		local function cargar_snippets()
			for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/plugins/luasnip/snippets/*.lua", true)) do
				local status, err = pcall(function()
					loadfile(ft_path)()
				end)
				if not status then
					print("Error al cargar el archivo de snippet:", err)
				end
			end
		end
	end,

	enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, "luasnip"),
}
