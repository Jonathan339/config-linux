local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then return end

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
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
  "eslint_lsp",
  "rust_analyzer",
  "sumneko_lua",
  "lua_ls",
  "prettier",
  "tsserver",
  "eslint",
  "bashls",
  "vimls",
  "lua_format",
  "jsonls",
})

-- Configura los íconos para los errores, advertencias, sugerencias e información del LSP.
lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})
-- Configura la función de autocompletado del LSP.
lsp.omnifunc.setup({
  autocomplete = true,
  use_fallback = true,
  update_on_delete = true,
  trigger = "<C-Space>",
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
