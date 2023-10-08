local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover
local sources = {
	-- Formateo
	formatting.stylua,
	formatting.prettier,
    formatting.black,
    formatting.standardjs,

	-- Diagnósticos
	diagnostics.standardjs,
	diagnostics.jsonlint,
	diagnostics.ktlint,
	diagnostics.markdownlint,
	diagnostics.protoc_gen_lint,
	diagnostics.fish,
	diagnostics.luacheck,
    diagnostics.shellcheck,



	-- Completado de ortografía
	completion.spell,
	completion.tags,

	-- Acciones de código
	code_actions.refactoring,
	-- hover
	hover.dictionary,
}

return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	opts = function()
	  local nls = require("null-ls")
	  return {
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
		sources = sources,
		diagnostics_format = "[#{c}] #{m} (#{s})",
		notify_format = "[null-ls] %s",
	  }
	end,
  }