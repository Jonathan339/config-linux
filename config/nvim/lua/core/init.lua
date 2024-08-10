-- Función para cargar módulos de manera segura
local function safe_require(module)
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify('Error loading ' .. module .. '\n\n' .. err, vim.log.levels.ERROR)
  end
end

-- Carga módulos principales sincrónicamente
local modules = {
  'core.options',
  'core.autocmd',
  'core.lazy',
}

for _, module in ipairs(modules) do
  safe_require(module)
end

-- Cargar módulos secundarios de manera asíncrona
vim.schedule(function()
  local async_modules = {
    'lsp.diagnostics',
    'core.map',
  }
  for _, module in ipairs(async_modules) do
    safe_require(module)
  end
end)

-- Ejemplo de carga condicional de módulos
if vim.fn.isdirectory(vim.fn.expand('~/.config/nvim/lua/lsp')) == 1 then
  vim.defer_fn(function()
    safe_require('lsp.diagnostics')
  end, 0)
end
