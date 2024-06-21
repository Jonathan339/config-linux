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
  local ls_lua_loader = require('luasnip.loaders.from_lua')
  local ls = require('luasnip')
  -- friendly-snippets - enable standardized comments snippets
  ls.filetype_extend('typescript', { 'tsdoc' })
  ls.filetype_extend('javascript', { 'jsdoc' })
  ls.filetype_extend('lua', { 'luadoc' })
  ls.filetype_extend('python', { 'pydoc' })
  ls.filetype_extend('rust', { 'rustdoc' })
  ls.filetype_extend('cs', { 'csharpdoc' })
  ls.filetype_extend('java', { 'javadoc' })
  ls.filetype_extend('c', { 'cdoc' })
  ls.filetype_extend('cpp', { 'cppdoc' })
  ls.filetype_extend('php', { 'phpdoc' })
  ls.filetype_extend('kotlin', { 'kdoc' })
  ls.filetype_extend('ruby', { 'rdoc' })
  ls.filetype_extend('sh', { 'shelldoc' })
  -- vscode format
  require('luasnip.loaders.from_vscode').lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
  require('luasnip.loaders.from_vscode').lazy_load({ paths = 'your path!' })
  require('luasnip.loaders.from_vscode').lazy_load({ paths = vim.g.vscode_snippets_path or '' })

  -- snipmate format
  require('luasnip.loaders.from_snipmate').load()
  require('luasnip.loaders.from_snipmate').lazy_load({ paths = vim.g.snipmate_snippets_path or '' })

  -- lua format
  ls_lua_loader.load()
  ls_lua_loader.lazy_load({ paths = vim.g.lua_snippets_path or '' })

  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      if require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()] and not require('luasnip').session.jump_active then
        require('luasnip').unlink_current()
      end
    end,
  })

  --- TODO: What is expand?
  vim.keymap.set({ 'i' }, '<C-s>e', function()
    ls.expand()
  end, { silent = true })

  vim.keymap.set({ 'i', 's' }, '<C-s>;', function()
    ls.jump(1)
  end, { silent = true })
  vim.keymap.set({ 'i', 's' }, '<C-s>,', function()
    ls.jump(-1)
  end, { silent = true })

  vim.keymap.set({ 'i', 's' }, '<C-E>', function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true })
end
return M
