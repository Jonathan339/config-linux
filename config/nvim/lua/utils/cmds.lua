local M = {}

M.on_attach = function(client, bufnr)
    vim.cmd([[
            augroup formatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                autocmd BufWritePre <buffer> lua OrganizeImports(1000)
            augroup END
        ]])

    -- Set autocommands conditional on server_capabilities
    --            augroup lsp_document_highlight
    --                 autocmd! * <buffer>
    --                 autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --                 autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --             augroup END
    --         ]])
end

return M
