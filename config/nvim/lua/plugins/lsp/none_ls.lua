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
	formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes
	formatting.black,
	formatting.standardjs.with({ extra_args = { "--stdin", "--fix" } }),
	formatting.autopep8,
	formatting.beautysh,
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.lua_format.with({ extra_args = { "-i" } }),
        formatting.dtsfmt,
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

	-- Hover
	hover.dictionary,
}

return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	opts = {
		debug = false,
		sources = sources,
		diagnostics_format = "[#{c}] #{m} (#{s})",
		on_attach = function(client, bufnr)
      -- Enable formatting on sync
      if client.supports_method("textDocument/formatting") then
        local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = format_on_save,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              bufnr = bufnr,
              filter = function(_client)
                return _client.name == "null-ls"
              end
            })
          end,
        })
      end
    end
  },
	config = function(opts)
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		-- local null = require("null-ls")
		null_ls.setup(opts)
	end,
}
