return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    -- has configs
    { 'L3MON4D3/LuaSnip', dependencies = { 'rafamadriz/friendly-snippets', 'benfowler/telescope-luasnip.nvim' }, main = 'luasnip' },
  },
  event = 'InsertEnter',
  config = function()
    require('lsp.completion.cmp')
  end,
}
