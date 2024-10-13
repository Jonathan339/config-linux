return {
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({
        style = 'darker',
      })
      require('onedark').load()
    end,
  },
  {
    'morhetz/gruvbox',
  },
  {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        dark = 'mocha',
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      })
    end,
  },
  {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup({
        Error = '#db4b4b',
        Warning = '#e0af68',
        Information = '#0db9d7',
        Hint = '#10B981',
      })
    end,
  },
  { 'daltonmenezes/aura-theme' },
  { 'catppuccin/nvim',         name = 'catppuccin', priority = 1000 },
}
