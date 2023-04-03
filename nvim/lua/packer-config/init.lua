-- Instala automáticamente Packer si aún no está instalado
local packer_install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Asegura que Packer esté instalado y configura los complementos
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

-- Autocomandos para Packer
vim.cmd[[
  augroup Packer_aug
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
    autocmd BufWritePost plugins.lua PackerClean
    autocmd BufWritePost plugins.lua PackerInstall
  augroup END
]]

-- Configuración de plugins
require('packer').startup(function()
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Autocompletado
  use {
    'hrsh7th/nvim-compe',
    config = function() require('plugins.nvim-compe') end
  }

  -- Tema de color
  use 'gruvbox-community/gruvbox'

  -- Navegación de archivos
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.nvim-tree') end
  }

  -- Búsqueda y selección de archivos
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require('plugins.telescope') end
  }

  -- Integración con React
  use 'mattn/vim-jsx-pretty'
  use 'pangloss/vim-javascript'
  use 'yuezk/vim-js'

end)

-- Configuración para mattn/vim-jsx-pretty
vim.g.vim_jsx_pretty_highlight_close_tag = 1

-- Configuración para pangloss/vim-javascript
vim.g.javascript_plugin_flow = 1
vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"

-- Configuración para yuezk/vim-js
vim.g.javascript_enable_domhtmlcss = 1
