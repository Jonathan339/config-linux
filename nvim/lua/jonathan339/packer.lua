-- Rutas de complementos y variables
local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local fzf_install_dir = vim.fn.expand('~/.fzf')

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

-- Configuración de complementos
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Administrador de complementos
    use 'gruvbox-community/gruvbox' -- Tema de color
    use 'nvim-lualine/lualine.nvim' -- Barra de estado
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
         requires = {{'nvim-lua/plenary.nvim'}}} -- Funciones de utilidad de Lua
    use {"nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }}
    use {'akinsho/toggleterm.nvim', config = function()
        require("toggleterm").setup()
    end} -- Terminal flotante

    use 'airblade/vim-gitgutter' -- Marcador de cambios en Git
    use 'Pocco81/auto-save.nvim' -- Guardar automáticamente los archivos

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- Análisis sintáctico y resaltado de árbol
    use 'nvim-tree/nvim-web-devicons' -- Iconos para nvim-tree

    use 'Exafunction/codeium.vim' -- Codeium

    use {'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            'neovim/nvim-lspconfig', -- LSP Support
            'hrsh7th/nvim-cmp', -- Autocompletion
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'williamboman/mason.nvim', -- Optional
            'williamboman/mason-lspconfig.nvim' -- Optional
        }}
    end)




--Función para limpiar, instalar y compilar complementos con Packer
local function packer_cleanup_install_compile()
    vim.cmd([[PackerClean]])
    vim.cmd([[PackerInstall]])
    vim.cmd([[PackerCompile]])
end



--Llamar a la función de limpieza, instalación y compilación de Packer
packer_cleanup_install_compile()

