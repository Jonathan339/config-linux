-- Rutas de complementos y variables

local packer_install_path = vim.fn.stdpath('data') ..
                                '/site/pack/packer/start/packer.nvim'
local fzf_install_dir = '~/.fzf'

-- Instalación automática de Packer si aún no está instalado
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
    vim.fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', packer_install_path
    })
    vim.cmd [[packadd packer.nvim]]
end

-- Verificar si Packer está instalado correctamente
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

-- Autocomandos para Packer
vim.cmd [[
  augroup Packer_aug
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
    autocmd BufWritePost plugins.lua PackerClean
    autocmd BufWritePost plugins.lua PackerInstall
  augroup END
]]

-- Función para limpiar, instalar y compilar complementos con Packer
function packer_cleanup_install_compile()
    vim.cmd([[PackerClean]])
    vim.cmd([[PackerInstall]])
    vim.cmd([[PackerCompile]])
end

-- Configuración de complementos
require('packer').startup(function()
    -- Administrador de complementos
    use 'wbthomason/packer.nvim'
    -- Tema de color
    use 'gruvbox-community/gruvbox'
    -- Barra de estado
    use 'nvim-lualine/lualine.nvim'
      -- Funciones de utilidad de Lua
     use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }}

    --use 'nvim-lua/plenary.nvim'
    -- Marcador de cambios en Git
    use 'airblade/vim-gitgutter'
    -- Guardar automáticamente los archivos
    use 'Pocco81/auto-save.nvim'
   -- Análisis sintáctico y resaltado de árbol
     use {'nvim-treesitter/nvim-treesitter',
           run = function()
           local ts_update = require('nvim-treesitter.install').update({ with_sync = true })			ts_update()
	  end,}

    use 'nvim-tree/nvim-web-devicons'
    -- Codeium 
    use 'Exafunction/codeium.vim'
   
   use {
        'VonHeikemen/lsp-zero.nvim',
         branch = 'v2.x',
         requires = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},             -- Required
         {'williamboman/mason.nvim'},           -- Optional
         {'williamboman/mason-lspconfig.nvim'}, -- Optional

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},     -- Required
         {'hrsh7th/cmp-nvim-lsp'}, -- Required
         {'L3MON4D3/LuaSnip'},     -- Required
        }}


  end)



