vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver', 'eslint', 'emmet_ls', 'lua_ls', -- 'sumneko_lua',
    'pyright', 'bashls', 'cssls', 'eslint', 'html', 'jsonls', 'tsserver',
    'yamlls', 'lua_ls', 'bashls', 'cssls', 'quick_lint_js', 'remark_ls',
    'pyright', 'sqlls', 'vimls', 'jdtls', 'emmet_ls', 'clangd', 'clangd',
    'angularls'
})

lsp.nvim_workspace()

lsp.setup()

-- Make sure you setup `cmp` after lsp-zero

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab()
    }
})

