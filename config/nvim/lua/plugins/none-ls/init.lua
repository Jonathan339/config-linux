local M = {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'gbprod/none-ls-shellcheck.nvim',
  },
}
M.config = function()
  local null_ls = require('null-ls')
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local completion = null_ls.builtins.completion
  local code_actions = null_ls.builtins.code_actions
  local hover = null_ls.builtins.hover

  -- Configuración de fuentes
  local sources = {
    -- Formateo
    -- formatting.standardjs,
    formatting.prettier,
    formatting.stylua,
    formatting.black,
    formatting.markdownlint,
    formatting.smlfmt,
    -- Diagnósticos
    diagnostics.markdownlint,
    diagnostics.fish,
    require('none-ls.diagnostics.eslint'),
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

  -- Configurar null-ls con las fuentes definidas

  null_ls.setup({
    sources = sources,
    debug = false,
    on_attach = require('config.user').on_attach,
  })
end

return M
