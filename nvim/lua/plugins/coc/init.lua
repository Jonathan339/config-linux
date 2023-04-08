-- Configuración de extensiones de CoC
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-git',
  'coc-tsserver',
  'coc-css',
  'coc-lua',
  'coc-clangd',
  'coc-snippets',
  'coc-python',
  'coc-markdownlint',
  'coc-highlight',
  'coc-pairs',
  'coc-jedi',
  'coc-sh',
  'coc-sql',
  'coc-yaml',
}

-- Configuración para ignorar el mensaje de 'undefined global' en Lua
-- Reemplaza 'undefinedVariable' con el nombre específico del mensaje que deseas ignorar
-- en tu caso.
vim.g.coc_diagnostic_ignore_sources = { 'lua.undefinedVariable' }

