local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover

local sources = {
  -- Formateo
  formatting.stylua,
  formatting.prettier,
  formatting.black,
  formatting.standardjs.with({ extra_args = { "--stdin", "--fix" } }),
  formatting.autopep8,
  formatting.beautysh,
  formatting.black.with({ extra_args = { "--fast" }}),
  formatting.dart_format.with({ extra_args = { "format" } }),
  formatting.dtsfmt,
  formatting.lua_format.with({ extra_args = { "-i" } }),
  formatting.prettier,
  formatting.reorder_python_imports.with({ extra_args = { "-", "--exit-zero-even-if-changed" } }),

  -- Diagnósticos
  diagnostics.standardjs,
  diagnostics.jsonlint,
  diagnostics.ktlint,
  diagnostics.markdownlint,
  diagnostics.protoc_gen_lint,
  diagnostics.luacheck,
  diagnostics.shellcheck,

  -- Completado de ortografía
  completion.spell,
  completion.tags,

  -- Acciones de código
  code_actions.refactoring,

  -- Hover
  hover.dictionary,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  config = function()
    local null = require("null-ls")
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d.with({
          diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        null_ls.builtins.diagnostics.fish
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end
    }

    vim.api.nvim_create_user_command(
      'DisableLspFormatting',
      function()
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
      end,
      { nargs = 0 }
    )
  end,
}
