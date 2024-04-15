local M = {
  'nvimtools/none-ls.nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  event = 'VeryLazy',
}
M.config = function()
  local null_ls = require('null-ls')
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local completion = null_ls.builtins.completion
  local code_actions = null_ls.builtins.code_actions
  local hover = null_ls.builtins.hover
  local opt = require('configs.lsp.default')

  -- Formateo
  local sources = {
    formatting.standardjs,
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
    on_attach = function(client, bufnr)
      vim.cmd([[
					augroup formatting
						autocmd! * <buffer>
						autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
						autocmd BufWritePre <buffer> lua OrganizeImports(1000)
					augroup END
				]])

      -- Set autocommands conditional on server_capabilities
      --            augroup lsp_document_highlight
      --                 autocmd! * <buffer>
      --                 autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      --                 autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      --             augroup END
      --         ]])
    end,
  })
end
return M
