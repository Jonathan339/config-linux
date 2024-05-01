local M = {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'benfowler/telescope-luasnip.nvim',
  },
  build = vim.fn.has('win32') ~= 0 and 'make install_jsregexp' or nil,
}
M.config = function()
  -- if opts then
  --   require('luasnip').config.setup(opts)
  -- end
  vim.tbl_map(function(type)
    require('luasnip.loaders.from_' .. type).lazy_load()
  end, { 'vscode', 'snipmate', 'lua' })

  -- friendly-snippets - enable standardized comments snippets
  require('luasnip').filetype_extend('typescript', { 'tsdoc' })
  require('luasnip').filetype_extend('javascript', { 'jsdoc' })
  require('luasnip').filetype_extend('lua', { 'luadoc' })
  require('luasnip').filetype_extend('python', { 'pydoc' })
  require('luasnip').filetype_extend('rust', { 'rustdoc' })
  require('luasnip').filetype_extend('cs', { 'csharpdoc' })
  require('luasnip').filetype_extend('java', { 'javadoc' })
  require('luasnip').filetype_extend('c', { 'cdoc' })
  require('luasnip').filetype_extend('cpp', { 'cppdoc' })
  require('luasnip').filetype_extend('php', { 'phpdoc' })
  require('luasnip').filetype_extend('kotlin', { 'kdoc' })
  require('luasnip').filetype_extend('ruby', { 'rdoc' })
  require('luasnip').filetype_extend('sh', { 'shelldoc' })

  -- vscode format
  require('luasnip.loaders.from_vscode').lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
  require('luasnip.loaders.from_vscode').lazy_load({ paths = 'your path!' })
  require('luasnip.loaders.from_vscode').lazy_load({ paths = vim.g.vscode_snippets_path or '' })

  -- snipmate format
  require('luasnip.loaders.from_snipmate').load()
  require('luasnip.loaders.from_snipmate').lazy_load({ paths = vim.g.snipmate_snippets_path or '' })

  -- lua format
  require('luasnip.loaders.from_lua').load()
  require('luasnip.loaders.from_lua').lazy_load({ paths = vim.g.lua_snippets_path or '' })

  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      if require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()] and not require('luasnip').session.jump_active then
        require('luasnip').unlink_current()
      end
    end,
  })
end
return M
