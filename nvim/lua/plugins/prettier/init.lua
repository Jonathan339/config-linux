-- Configuración de Prettier
vim.cmd([[autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.scss,*.html,*.md,*.vue Prettier]])

-- Mapeo para ejecutar manualmente Prettier
vim.api.nvim_set_keymap("n", "<Leader>p", "<Cmd>lua run_prettier()<CR>", { noremap = true, silent = true })

