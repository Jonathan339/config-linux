local M = {
  'olimorris/onedarkpro.nvim',

  priority = 1000, -- Ensure it loads first
}
M.config = function() -- Default options:
  require('onedarkpro').setup({
    highlights = {
      Comment = { italic = true },
      Directory = { bold = true },
      ErrorMsg = { italic = true, bold = true },
    },
  })

  require('onedarkpro').load()
end

return M

