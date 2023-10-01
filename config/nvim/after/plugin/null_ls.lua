local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover

local sources = {
  -- Formateo
  formatting.lua_format,
  formatting.stylua,
  formatting.prettier_standard,
  formatting.standardjs,  -- Formateo con standardjs

  -- Diagnósticos
  diagnostics.standardjs,  -- Diagnóstico con standardjs
  diagnostics.jsonlint,
  diagnostics.ktlint,
  diagnostics.markdownlint,
  diagnostics.protoc_gen_lint,
  diagnostics.fish,
  diagnostics.luacheck,
  diagnostics.selene,

  -- Completado de ortografía
  completion.spell,
  completion.tags,

  -- Acciones de código
  code_actions.eslint,
  code_actions.refactoring,
  code_actions.statix,
  --code_actions.ts_node_action,
  -- Mantener para otras acciones de código
  -- hover
  hover.dictionary
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.formatting({
    bufnr = bufnr,
  })
end

local null_ls = require("null-ls")
local sources = {
  -- Aquí debes agregar tus fuentes de null-ls, como formatting, diagnostics, etc.
}

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        cmd = "lua lsp_formatting(" .. bufnr .. ")",
      })
    end
  end,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  notify_format = "[null-ls] %s",
})

vim.api.nvim_command(
  'command! DisableLspFormatting lua vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })'
)
