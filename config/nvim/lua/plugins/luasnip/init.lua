local M = {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'benfowler/telescope-luasnip.nvim',
  },
  opts = {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
  },
  build = vim.fn.has('win32') == 1 and 'make install_jsregexp' or nil,
}

M.config = function(_, opts)
  -- luasnip.lua

  -- Función para cargar los snippets
  local function cargar_snippets()
    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/plugins/luasnip/snippets/*.lua', true)) do
      local status, err = pcall(function()
        loadfile(ft_path)()
      end)
      if not status then
        print('Error al cargar el archivo de snippet:', err)
      end
    end
  end

  -- Programa la carga de snippets para que se ejecute de forma asíncrona
  vim.schedule(cargar_snippets)
  -- vscode format
  require('luasnip.loaders.from_vscode').lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
  require('luasnip.loaders.from_vscode').lazy_load({ paths = vim.g.vscode_snippets_path or '' })

  -- snipmate format
  require('luasnip.loaders.from_snipmate').load()
  require('luasnip.loaders.from_snipmate').lazy_load({ paths = vim.g.snipmate_snippets_path or '' })

  -- lua format
  require('luasnip.loaders.from_lua').load()
  require('luasnip.loaders.from_lua').lazy_load({ paths = vim.g.lua_snippets_path or '' })
end

return M
