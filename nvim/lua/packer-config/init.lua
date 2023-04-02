-- Instalación automática de Packer si no está instalado
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    vim.api.nvim_command('packadd packer.nvim')
end

-- Configuración de plugins
require('packer').startup(function()
    -- Plugin manager
    use 'wbthomason/packer.nvim'
    
    -- Autocompletado
    use 'hrsh7th/nvim-compe'

    -- Tema de color
    use 'gruvbox-community/gruvbox'

    -- Navegación de archivos
    use 'kyazdani42/nvim-tree.lua'

    -- Búsqueda y selección de archivos
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    
    }
    
    use {'notify-rs/vim-notify'}

    -- Integración con React
    use 'mattn/vim-jsx-pretty'
    use 'pangloss/vim-javascript'
    use 'yuezk/vim-js'
end)