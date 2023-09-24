-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
local mason_null_status, mason_null = pcall(require, "mason-null-ls")
if not mason_null_status then
  return
end

mason_null.setup({
  ensure_installed = nil,
  automatic_installation = true,
})
