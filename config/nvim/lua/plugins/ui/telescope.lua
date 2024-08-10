local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
}

M.config = function()
  local telescope = require('telescope')

  -- Configurar las opciones predeterminadas de Telescope
  telescope.setup({ defaults = { file_ignore_patterns = { 'node_modules' } } })

  -- Cargar extensiones adicionales de Telescope
  telescope.load_extension('file_browser')
  telescope.load_extension('live_grep_args')
end

return M
