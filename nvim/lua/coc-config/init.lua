    vim.g.coc_global_extensions = {'coc-json', 
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
                                   'coc-jedi',,
                                   'coc-html5'
                                   }

--vim.fn.nvim_command('inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"')

--inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

vim.cmd([[
    inoremap <silent><expr> <TAB>             ]]
    .. [[ pumvisible() ? "<C-n>" :            ]]
    .. [[ <SID>check_back_space() ? "<TAB>" : ]]
    .. [[ coc#refresh()
]])
vim.cmd([[ inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<C-h>" ]])

