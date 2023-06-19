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

    ----------------------------------------
    -- Complementos de edición y apariencia --
    ----------------------------------------

    -- Gestión del entorno de desarrollo integrado
    -- https://github.com/VonHeikemen/lsp-zero.nvim
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'}, -- Autocompletion
            {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'}, -- Snippets
            {'L3MON4D3/LuaSnip'}, {'rafamadriz/friendly-snippets'}
        }
    }

    -- Tema de color
    use 'gruvbox-community/gruvbox'

    -- Barra de estado
    use 'nvim-lualine/lualine.nvim'

    ------------------------------------------------
    -- Complementos de exploración y navegación  --
    ------------------------------------------------

    -- Explorador de archivos
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        }
    }

    -- Búsqueda y selección de archivos
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-file-browser.nvim'

    ----------------------------------------
    -- Complementos de utilidad y soporte --
    ----------------------------------------

    -- Funciones de utilidad de Lua
    use 'nvim-lua/plenary.nvim'

    -- Marcador de cambios en Git
    use 'airblade/vim-gitgutter'

    -- Guardar automáticamente los archivos
    use 'Pocco81/auto-save.nvim'

    -- Administrador de entornos virtuales
    use 'jmcantrell/vim-virtualenv'

    -- Formateo de código con Prettier
    use {'prettier/vim-prettier', run = 'yarn install'}

    -------------------------------------
    -- Complementos de análisis de código --
    -------------------------------------

    -- Análisis sintáctico y resaltado de árbol
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-tree/nvim-web-devicons'

    --------------------------------------
    -- Complementos de productividad     --
    --------------------------------------
    -- Codeium 
    use 'Exafunction/codeium.vim'

    -- Fuzzy Finder
    use {'junegunn/fzf', dir = fzf_install_dir, run = './install --all'}
    use 'junegunn/fzf.vim'

    -- Explorador de archivos y directorios
    use 'scrooloose/nerdtree'

    -- Navegación fluida entre Neovim y tmux
    use 'christoomey/vim-tmux-navigator'

    -----------------------------------
    -- Complementos de notificaciones --
    -----------------------------------

    -- Notificaciones emergentes
    use 'rcarriga/nvim-notify'

    -- Iconos adicionales
    use {'yamatsum/nvim-nonicons', requires = {'kyazdani42/nvim-web-devicons'}}

    -----------------------------------------
    -- Complementos para desarrollo web     --
    -----------------------------------------

    -- Integración con React y TypeScript
    use 'peitalin/vim-jsx-typescript'

    -- Resaltado y soporte de JavaScript
    use 'pangloss/vim-javascript'
    use 'yuezk/vim-js'
end)

-- Configuración específica para complementos de JavaScript
vim.g.javascript_plugin_flow = 1
vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"

-- Configuración de NERDTree
vim.g.NERDTreeShowHidden = 1
-- vim.cmd [[
--  autocmd StdinReadPre * let s:std_in=1
--  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
-- ]]



