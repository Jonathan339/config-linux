return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    -- See mason-null-ls.nvim's documentation for more details:
    -- https://github.com/jay-babu/mason-null-ls.nvim#setup
    mason_null.setup({
      ensure_installed = nil,
      automatic_installation = false, -- You can still set this to `true`
      automatic_setup = true,
    })
    -- Required when `automatic_setup` is true
    mason_null.setup_handlers()-- require your null-ls config here (example below)
  end,
}

