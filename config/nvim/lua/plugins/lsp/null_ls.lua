local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover

local sources = {
	-- Formateo
	formatting.stylua,
	-- formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes
	formatting.black,
	formatting.standardjs, -- .with({ extra_args = { "--stdin", "--fix" } }),
	formatting.autopep8,
	formatting.beautysh,
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.lua_format.with({ extra_args = { "-i" } }), -- formatting.dtsfmt,
	-- Diagnósticos
	diagnostics.standardjs.with({ extra_args = { "--stdin" } }),
	diagnostics.jsonlint,
	diagnostics.markdownlint,
	diagnostics.luacheck,
	diagnostics.zsh,
	diagnostics.shellcheck, -- Completado de ortografía
	completion.spell.with({
		filetypes = { "gitcommit", "markdown", "text", "asciidoc" },
	  }),
	completion.tags, -- Acciones de código
	code_actions.refactoring, -- Hover
	code_actions.gitsigns,
	hover.dictionary,
}

return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = sources,
			diagnostics_format = "[#{c}] #{m} (#{s})",

			on_attach = require("utils.cmds").on_attach,})
	end
}
