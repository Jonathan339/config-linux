-- Instala automáticamente Packer si aún no está instalado
local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
    vim.fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', packer_install_path
    })
    vim.cmd [[packadd packer.nvim]]
end

-- Asegura que Packer esté instalado y configura los complementos
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


    --
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Tema de color
    use 'gruvbox-community/gruvbox'

    use 'nvim-lualine/lualine.nvim' -- Statusline

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
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
    
    use 'nvim-lua/plenary.nvim'
    -- Git gutter
    use 'airblade/vim-gitgutter'

    -- Auto-save
    use 'Pocco81/auto-save.nvim'
    --
    use 'jmcantrell/vim-virtualenv'

    -- Prettier
    use {'prettier/vim-prettier', run = 'yarn install'}


    -- Análisis sintáctico de árbol
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-tree/nvim-web-devicons'

    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
    use 'junegunn/fzf.vim' -- necesario para las vistas previas
    use 'scrooloose/nerdtree'
    use 'christoomey/vim-tmux-navigator'
    
    -- Notificaciones
    use 'rcarriga/nvim-notify'
    use {'yamatsum/nvim-nonicons', requires = {'kyazdani42/nvim-web-devicons'}}
    
    -- Integración con React
    use 'peitalin/vim-jsx-typescript'
    use 'pangloss/vim-javascript'
    use 'yuezk/vim-js'
end)

-- Configuración para pangloss/vim-javascript
vim.g.javascript_plugin_flow = 1
vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"

-- Configuración para yuezk/vim-js
vim.g.javascript_plugin_flow = 1
vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"

-- configuracion para Nerdtree
vim.g.NERDTreeShowHidden = 1
vim.cmd[[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
]]

