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
    formatting.standardjs.with({ extra_args = { "--stdin", "--fix" } }),
	formatting.autopep8,
	formatting.beautysh,
	formatting.black.with({ extra_args = {"--fast"}}),
	formatting.dart_format.with({ extra_args = { "format" }}),
	formatting.dtsfmt,
	formatting.lua_format.with({ extra_args = { "-i" }}),
	formatting.prettier,
	formatting.reorder_python_imports.with({ extra_args = { "-", "--exit-zero-even-if-changed" }}),
	-- Diagnósticos
	diagnostics.standardjs,
	diagnostics.jsonlint,
	diagnostics.ktlint,
	diagnostics.markdownlint,
	diagnostics.protoc_gen_lint,
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
		on_attach = function(client)

			if client.server_capabilities.documentFormattingProvider then
				vim.cmd([[
				augroup LspFormatting
					autocmd! * <buffer>
					autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 2000 })
				augroup END
				]])
			end
		  end,
		diagnostics_format = "[#{c}] #{m} (#{s})",
		notify_format = "[null-ls] %s",
	  }
	end,
  }

