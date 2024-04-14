return {
  "lukas-reineke/lsp-format.nvim",
  event = "BufReadPre",
  config = function()
    require("lsp-format").setup()
  end,


}
