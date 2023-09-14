local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
  ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "tsserver",
    "eslint",
    "bashls",
    "vimls",
    "jsonls",
    "pyright",
    "yamlls",
    "emmet_ls",
    "html",
    "graphql",
    "zls",
    "tailwindcss",
    "dockerls",
    "cssls",
  },

})

lspconfig.setup {
  automatic_installation = true
}
