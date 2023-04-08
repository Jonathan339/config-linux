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
-- Función para limpiar, instalar y compilar plugins con Packer
function packer_cleanup_install_compile()
  vim.cmd([[PackerClean]])
  vim.cmd([[PackerInstall]])
  vim.cmd([[PackerCompile]])
end

-- Configuración de plugins
require('packer').startup(function()
  -- Plugin manager
  use 'wbthomason/packer.nvim' 

  -- Tema de color
  use 'gruvbox-community/gruvbox'

  -- Navegación de archivos
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- opcional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }

  -- Búsqueda y selección de archivos
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('telescope').setup {}
    end
  }

  use {'neoclide/coc.nvim', branch = 'release'}
  -- Git gutter
  use 'airblade/vim-gitgutter'

  -- Auto-save
  use 'Pocco81/auto-save.nvim'

  -- Prettier
  use {'prettier/vim-prettier', run = 'yarn install' }

  -- Configuración de LSP
  use 'neovim/nvim-lspconfig'
  
  -- Análisis sintáctico de árbol
  use 'nvim-treesitter/nvim-treesitter'

  -- Integración con React
  use 'pangloss/vim-javascript'
  use 'yuezk/vim-js'
end)

-- Configuración para pangloss/vim-javascript
vim.g.javascript_plugin_flow = 1
vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"

-- Configuración para yuezk/vim-js
vim.g.javascript_enable_domhtmlcss = 1

-- Limpia, instala y compila los plugins con Packer
packer_cleanup_install_compile()
