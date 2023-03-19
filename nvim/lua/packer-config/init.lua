local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  -- Autocommand that reloads neovim whenever you save the plugins.lua file
  vim.cmd[[
    augroup Packer_aug
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
    autocmd BufWritePost plugins.lua PackerClean
    autocmd BufWritePost plugins.lua PackerInstall
    augroup END
  ]]
  
  local packer_bootstrap = ensure_packer()
  
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
    use {'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    --
    use 'sainnhe/gruvbox-material'
    --- Git diff in vim
    use 'airblade/vim-gitgutter'
    -- Theme
    use { "ellisonleao/gruvbox.nvim" }
    -- Auto-save
    use 'Pocco81/auto-save.nvim'
    -- code runner
    use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
    --
    use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }}
    --
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
    --notify
     use({ -- Notifications
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({ max_width = 400, background_colour = "#0f111a" })
      vim.notify = require("notify")
    end,
  })

    use{"plytophogy/vim-virtualenv"} -- Virtual env

    --
    use {'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
    -- prettier
    use {'prettier/vim-prettier', run = 'yarn install' }
    --lsp config
    use {'VonHeikemen/lsp-zero.nvim'}
  
    use {'neovim/nvim-lspconfig'}             -- Required
    use {'williamboman/mason.nvim'}           -- Optional
    use {'williamboman/mason-lspconfig.nvim'}-- Optional

    -- Autocompletion
    use {'neoclide/coc.nvim', branch = 'release'}
    -- nui.vim
    use {'MunifTanjim/nui.nvim'}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
