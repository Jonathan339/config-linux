require('core.options')
require('core.autocmd')
require('core.lazy')
vim.schedule(function()
  require('core.diagnostic')
  require('core.map')
end)
