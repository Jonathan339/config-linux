return {
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'j-hui/fidget.nvim',
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      --local opt = require("configs.lsp.default")
      local lspconfig = require('lspconfig')
      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
        lsp_zero.buffer_autoformat()
      end)

      -- to learn how to use mason.nvim with lsp-zero
      -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      require('mason').setup({
        -- ensure_installed = { "selene" },
        max_concurrent_installers = 10,
        log_level = vim.log.levels.DEBUG,
        ui = {
          check_outdated_packages_on_open = false,
          icons = {
            package_installed = '',
            package_pending = '',
            package_uninstalled = '',
          },
        },
      })
      require('mason-lspconfig').setup({
        automatic_installation = true,
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
          end,
          omnisharp = function()
            lspconfig.omnisharp.setup({
              handlers = { ['textDocument/definition'] = require('omnisharp_extended').handler },
            })
          end,
        },
      })
      require('mason-tool-installer').setup({
        ensure_installed = require('config.user').lsp.ensure_installed,
      })
      require('fidget').setup({})
    end,
  },
}
