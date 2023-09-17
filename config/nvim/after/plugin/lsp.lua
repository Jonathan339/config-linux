local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then return end
lsp.preset('recommended')

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  lsp.dir.find_all({ 'package.json', 'vetur.config.js', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml',
    'node_modules', 'npm-shrinkwrap.json', '.git' })
  enable_format_on_save(client, bufnr)
end)
-- Configura el formateo automático al guardar para ciertos servidores LSP y lenguajes.
lsp.format_on_save({
  enable = true,
  ormat_opts = {
    async = true,
    timeout_ms = 10000,
  },
  servers = {
    ["null-ls"] = { "javascript", "typescript", "lua" },
  },
})

lsp.set_server_config({
  single_file_support = false,
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
})

-- Instala servidores LSP y complementos.
lsp.ensure_installed({

})
-- Configura los íconos para los errores, advertencias, sugerencias e información del LSP.
lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup({
  on_attach = lsp.on_attach,
  enabled = true,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "\u{ea71}" },
    severity_sort = true,
  }
)
