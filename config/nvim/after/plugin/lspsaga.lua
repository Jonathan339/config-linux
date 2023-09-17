local status, saga = pcall(require, "lspsaga")
if not status then return end

saga.setup({
  ui = {
    border = "rounded",
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
