return {
  "glepnir/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "single",
        devicon = true,
        title = true,
      },
      symbol_in_winbar = {
        enable = true,
      },
      lightbulb = {
        enable = true,
      },
      outline = {
        layout = "float",
      },
      diagnostic = {
        virtual_text = true,
        max_height = 15,
        key = {
          quit = { "<Esc>", "q" },
        }
      },
    
    })
  end
}
