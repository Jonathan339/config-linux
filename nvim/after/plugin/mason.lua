local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end


mason.setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'eslint',
    'bashls',
    'eslint-lsp',
    'graphql-language-service-cli',
    'json-lsp',
    'lua-language-server',
    'prettierd',
    'rust-analyzer',
    'stylua',
    'typescript-language-server'
  },
  auto_update = true,
})

lspconfig.setup {
  automatic_installation = true
}
