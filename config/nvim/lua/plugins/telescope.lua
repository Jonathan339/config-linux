return {
  'nvim-telescope/telescope.nvim', tag = '0.1.3',
-- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim", 
  },
  config = function()
    require("telescope").setup({
      defaults = { file_ignore_patterns = {"node_modules"} } 
    })
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("live_grep_args")
 
  end
  }
