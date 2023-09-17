local status, null_ls = pcall(require, "null-ls")
if not status then return end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  --[[ formatting ]]
  formatting.eslint_d,
  formatting.autopep8,
  formatting.stylua,
  formatting.stylelint,
  formatting.prettier,

  --[[ code actions ]]
  code_actions.eslint_d,
  code_actions.refactoring,

  --[[ diagnostics ]]
  diagnostics.eslint_d,
  -- diagnostics.flake8,
}

null_ls.setup({
  sources = sources,
})
