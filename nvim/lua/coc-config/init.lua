-- Configuración de coc.nvim
vim.g.coc_global_extensions = {
    'coc-snippets',
    'coc-python',
    'coc-json',
    'coc-yaml',
    'coc-html',
    'coc-css',
    'coc-tsserver',
    'coc-eslint',
    'coc-prettier',
  }
  
  -- Habilitar el autocompletado inteligente
  vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })
  