require("lualine").setup {
    options = {theme = "gruvbox"},
    sections = {
      lualine_a = { "mode" },
      lualine_c = { "filetype" },
      lualine_x = { "branch", "diff", "diagnostics"},
      lualine_y = { "encoding" },
      lualine_z = { "location",}
    }
    }
    