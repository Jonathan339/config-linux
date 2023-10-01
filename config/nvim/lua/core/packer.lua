vim = vim or {}
-- Rutas de complementos y variables
local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- local fzf_install_dir = vim.fn.expand("~/.fzf")

-- Instalación automática de Packer si aún no está instalado
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

-- Verificar si Packer está instalado correctamente
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

-- Configuración de complementos
packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Administrador de complementos

  -- Complementos de Interfaz y Tema
  use 'joshdick/onedark.vim'
  use("gruvbox-community/gruvbox")
  use("nvim-lualine/lualine.nvim")
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {'nvim-lua/plenary.nvim'},
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("file_browser")
    end
  }  
  use  { 'nvim-telescope/telescope-fzf-native.nvim',    build = 'make' }
  use({

    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  })
  -- use 'rcarriga/nvim-notify'
  use({
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lspsaga").setup({})
    end,
  })

  -- Complementos de Resaltado y Sintaxis
  use("airblade/vim-gitgutter")
  use("Pocco81/auto-save.nvim")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-tree/nvim-web-devicons")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use 'folke/which-key.nvim'
  -- Complementos de Productividad y Desarrollo
  --
  use("Exafunction/codeium.vim")
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      "neovim/nvim-lspconfig",
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },           -- Required
      { 'hrsh7th/cmp-nvim-lsp' },       -- Required
      { 'L3MON4D3/LuaSnip' },           -- Required
      { "rafamadriz/friendly-snippets" },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  })
  use 'onsails/lspkind.nvim'
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  use("tpope/vim-commentary")

  -- Complementos de formateo y linters
  use("jose-elias-alvarez/null-ls.nvim")
  use("jay-babu/mason-null-ls.nvim")


  use("scrooloose/nerdtree")
  use("christoomey/vim-tmux-navigator")
end)

-- Función para limpiar, instalar y compilar complementos con Packer
local function packer_cleanup_install_compile()
  vim.cmd([[PackerClean]])
  vim.cmd([[PackerInstall]])
  vim.cmd([[PackerCompile]])
end

-- Llamar a la función de limpieza, instalación y compilación de Packer
packer_cleanup_install_compile()
