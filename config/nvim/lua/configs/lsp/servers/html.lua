local lsp_attach = require "configs.lsp.attach"
local lsp_flags = require "configs.lsp.flags"

return function(ops)
  local config = {
    on_attach = lsp_attach,
    flags = lsp_flags,
  }
  if vim.fn.executable "html-languageserver" == 1 then
    config.cmd = { "html-languageserver", "--stdio" }
  end

  return vim.tbl_extend("force", config, ops)
end
