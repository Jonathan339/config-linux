-- Verifica si Packer está instalado y, de lo contrario, lo instala automáticamente
local packer_install_path = vim.fn.stdpath('data') ..
                                '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
    -- Clona el repositorio de Packer si no está presente
    vim.fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', packer_install_path
    })
    -- Carga Packer para que esté disponible
    vim.cmd [[packadd packer.nvim]]
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

vim.cmd [[
  augroup Packer_aug
    autocmd!
    -- Auto-actualización de Packer después de guardar el archivo plugins.lua
    autocmd BufWritePost plugins.lua PackerCompile
    -- Limpia los complementos no utilizados después de guardar el archivo plugins.lua
    autocmd BufWritePost plugins.lua PackerClean
    -- Instala los complementos nuevos o actualizados después de guardar el archivo plugins.lua
    autocmd BufWritePost plugins.lua PackerInstall
  augroup END
]]

-- Función para limpiar, instalar y compilar los complementos con Packer
function packer_cleanup_install_compile()
    vim.cmd([[PackerClean]])
    vim.cmd([[PackerInstall]])
    vim.cmd([[PackerCompile]])
end

require('packer').startup(function()
    -- Configuración de los complementos utilizando Packer
    use 'wbthomason/packer.nvim' -- Administrador de complementos (Packer)
    ----------------------------------------
    -- Complementos de edición y apariencia --
    ----------------------------------------

    -- Gestión del entorno de desarrollo integrado
    use {'neoclide/coc.nvim', branch = 'release'}

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

-- Configuración específica para pangloss/vim-javascript
vim.g.javascript_plugin_flow = 1
vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"

-- Configuración para NERDTree
vim.g.NERDTreeShowHidden = 1
-- vim.cmd [[
--  autocmd StdinReadPre * let s:std_in=1
--  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
-- ]]
