local M = {}
local u = require('utils')
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not cmp_nvim_lsp_ok then
  vim.notify('Error cargando cmp_nvim_lsp. Asegúrate de que el plugin esté instalado.', vim.log.levels.ERROR)
  return M
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local augroup_name = 'LspDefault'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })
local user_config = {}
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- Función para configurar opciones del buffer
local function buf_set_option(bufnr, name, value)
  vim.api.nvim_set_option_value(name, value, { buf = bufnr })
end

-- Función para formateo asincrónico
local function async_formatting(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(bufnr, 'textDocument/formatting', vim.lsp.util.make_formatting_params({}), function(err, res, ctx)
    if err then
      local err_msg = type(err) == 'string' and err or err.message
      vim.notify('formatting: ' .. err_msg, vim.log.levels.WARN)
      return
    end

    if res then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or 'utf-16')
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd('silent noautocmd update')
      end)
    end
  end)
end

-- Función on_attach que se ejecuta cuando el servidor LSP se adjunta a un buffer
M.on_attach = function(client, bufnr)
  -- Configurar omnicompletado
  buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Habilitar formateo asincrónico al guardar el buffer
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        async_formatting(bufnr)
      end,
    })
  end

  -- Habilitar hints en línea si el servidor las soporta
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end

  -- Configuración de inlay hints del usuario
  if user_config.lsp and user_config.lsp.inlay_hint and client.supports_method('textDocument/inlayHint') then
    vim.lsp.inlay_hint(bufnr, true)
  end
end

-- Fusionar capacidades predeterminadas con configuraciones adicionales
M.capabilities = u.merge(capabilities, {
  workspace = {
    didChangeWatchedFiles = {
      dynamicRegistration = false,
    },
  },
})

-- Determinar el directorio raíz del proyecto
M.root_dir = function(fname)
  local util = require('lspconfig').util
  return util.root_pattern('.git', 'tsconfig.base.json', 'tsconfig.json', 'package.json', '.eslintrc.js',
    '.eslintrc.json')(fname)
end

return M
