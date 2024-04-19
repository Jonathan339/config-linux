require("core.options")
-- autocmds and keymaps can wait to load
require("core.autocmd")

require("core.lazy")
require("core.diagnostic")
vim.schedule(function()
    require("core.map")
  end)