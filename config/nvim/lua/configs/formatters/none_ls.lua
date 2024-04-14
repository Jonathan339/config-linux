return {
   null_ls = require("null-ls")
	 formatting = null_ls.builtins.formatting
	 diagnostics = null_ls.builtins.diagnostics
	 completion = null_ls.builtins.completion
	 code_actions = null_ls.builtins.code_actions
	 hover = null_ls.builtins.hover
	 opt = require("configs.lsp.default")

	-- Formateo
	 sources = {
		-- formatting.standardjs,
		-- formatting.jq,
		formatting.stylua,
		--formatting.prettier,
		formatting.black,
		--formatting.jsonlint,
		formatting.markdownlint,

		-- Diagnósticos

		--diagnostics.selene,
		diagnostics.ktlint,
		diagnostics.markdownlint,
		diagnostics.fish,
		--diagnostics.eslint_d,

		-- Autocompletado de archivos

		completion.luasnip,
		completion.spell,
		completion.tags,
		-- Acciones de código

		code_actions.gitsigns,
		code_actions.gomodifytags,
		code_actions.refactoring,

		-- Hover
		hover.dictionary,
	}

	-- LSP
	null_ls.setup({
		sources = sources,
		on_attach = opt.lsp.on_attach,
	})
}
