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
    use {'neoclide/coc.nvim', branch = 'release'} -- Motor de finalización de código
    use 'gruvbox-community/gruvbox' -- Tema de color
    use 'nvim-lualine/lualine.nvim' -- Barra de estado
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        }
    } -- Explorador de archivos y directorios
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {{'nvim-lua/plenary.nvim'}}
    } -- Buscador y selector de archivos
    use 'nvim-telescope/telescope-file-browser.nvim' -- Integración de Telescope con el explorador de archivos
    use 'nvim-lua/plenary.nvim' -- Biblioteca de Lua para el desarrollo de complementos
    use 'airblade/vim-gitgutter' -- Marcas de cambio de Git en el margen
    use 'Pocco81/auto-save.nvim' -- Guardado automático de archivos
    use 'jmcantrell/vim-virtualenv' -- Soporte para entornos virtuales de Python
    use {'prettier/vim-prettier', run = 'yarn install'} -- Formateador de código Prettier
    use 'nvim-treesitter/nvim-treesitter' -- Análisis sintáctico de árbol
    use 'nvim-tree/nvim-web-devicons' -- Iconos para el explorador de archivos
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'} -- Utilidad de búsqueda FZF
    use 'junegunn/fzf.vim' -- Integración de FZF con Vim
    use 'scrooloose/nerdtree' -- Explorador de archivos estilo NERDTree
    use 'christoomey/vim-tmux-navigator' -- Navegación entre paneles de Vim y Tmux
    use 'rcarriga/nvim-notify' -- Notificaciones emergentes
    use {'yamatsum/nvim-nonicons', requires = {'kyazdani42/nvim-web-devicons'}} -- Iconos adicionales
    use 'peitalin/vim-jsx-typescript' -- Integración con React (JSX y TypeScript)
    use 'pangloss/vim-javascript' -- Soporte para JavaScript
    use 'yuezk/vim-js' -- Mejoras para JavaScript
end)

-- Configuración específica para pangloss/vim-javascript
vim.g.javascript_plugin_flow = 1
vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"

-- Configuración para NERDTree
vim.g.NERDTreeShowHidden = 1
vim.cmd [[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
]]
