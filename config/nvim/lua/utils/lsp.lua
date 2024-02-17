local M = {}
-- Verificar si el cliente LSP admite el método "textDocument/formatting"
M.on_attach = function(client, bufnr, lsp)
	if client.supports_method("textDocument/formatting") then
		local augroup = "lsp_formatting"
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(_client)
						return _client.name == "null-ls"
					end,
				})
			end,
		})
	end
end
local function format_on_save(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = augroup,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end
M.servers = {
	"lua",
	"cssls",
	"html",
	"tsserver",
	"bashls",
	"jsonls",
	"yamlls",
	"tailwindcss",
	"gopls",
	"astro",
	"jdtls",
	"pylsp",
	"clangd",
	"eslint",
}

M.languages = {
	"bash",
	"blade",
	"css",
	"go",
	"gomod",
	"html",
	"javascript",
	"json",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"nix",
	"org",
	"php",
	"phpdoc",
	"query",
	"rust",
	"sql",
	"svelte",
	"typescript",
	"regex",
	"vim",
	"yaml",
	"c",
	"jsdoc",
	"luap",
	"python",
	"tsx",
	"vimdoc",
}

M.icons = {
	DEBUG = "",
	ERROR = "",
	INFO = "",
	TRACE = "✎",
	WARN = "",
}
return M
