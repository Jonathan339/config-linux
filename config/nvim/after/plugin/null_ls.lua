local status, null_ls = pcall(require, "null-ls")
if not status then return end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover
local sources = {
  -- Formateo
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
  --diagnostics.selene,

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

-- LSP setup y otras configuraciones aquí...

null_ls.setup({
  sources = sources,
})
