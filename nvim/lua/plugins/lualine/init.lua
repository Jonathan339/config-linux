require("lualine").setup {

    options = {
     theme = "tokyonight",
    },
    
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename" },
      lualine_c = { "g:coc_status" },
      lualine_x = { "branch" },
      lualine_y = { "encoding" },
      lualine_z = { "location" }
    }