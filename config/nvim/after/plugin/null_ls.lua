local status, null_ls = pcall(require, "null-ls")
if not status then return end

local status_, lsp = pcall(require, "lsp-zero")
if not status_ then return end

lsp.preset("recommended")

lsp.format_on_save({
	format_opts = {
		async = true,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "lua" },
	},
})

lsp.setup()

local null_opts = lsp.build_options("null-ls", {})
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

	-- Diagnósticos
	diagnostics.eslint,
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

null_ls.setup({
	on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
	end,
	sources = sources,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	notify_format = "[null-ls] %s",
})
