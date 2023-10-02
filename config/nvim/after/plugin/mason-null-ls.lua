local mason_null_status, mason_null = pcall(require, "mason-null-ls")
if not mason_null_status then
	return
end

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
mason_null.setup({
  ensure_installed = nil,
  automatic_installation = false, -- You can still set this to `true`
  automatic_setup = true,
})

-- Required when `automatic_setup` is true
mason_null.setup_handlers()