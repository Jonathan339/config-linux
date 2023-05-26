-- Configuración de CoC
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

-- Iniciar CoC automáticamente
vim.cmd([[autocmd VimEnter * silent! CocStart]])
-- Muestra la documentación flotante al autocompletar
vim.g.coc_popup_max_height = 20
-- Atajos de teclado para autocompletado
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Mapear las teclas de navegación para el autocompletado
vim.api.nvim_set_keymap('i', '<C-n>', 'coc#refresh()<CR>', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-p>', 'coc#refresh()<CR>', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<C-h>"', {silent = true, expr = true})

-- Configuración para ignorar el mensaje de 'undefined global' en Lua
-- Reemplaza 'undefinedVariable' con el nombre específico del mensaje que deseas ignorar
-- en tu caso.
vim.g.coc_diagnostic_ignore_sources = { 'lua.undefinedVariable' }

