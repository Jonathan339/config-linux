local status, null_ls = pcall(require, "null-ls")
if not status then return end

local sources = {
  -- Formateo
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.prettier_standard,
  null_ls.builtins.formatting.standardjs,  -- Formateo con standardjs

  -- Diagnósticos
  null_ls.builtins.diagnostics.standardjs,  -- Diagnóstico con standardjs
  null_ls.builtins.diagnostics.jsonlint,
  null_ls.builtins.diagnostics.ktlint,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.protoc_gen_lint,
  null_ls.builtins.diagnostics.fish,
  --null_ls.builtins.diagnostics.selene,

  -- Completado de ortografía
  null_ls.builtins.completion.spell,
  null_ls.builtins.completion.tags,

  -- Acciones de código
  null_ls.builtins.code_actions.eslint,
  null_ls.builtins.code_actions.refactoring,
  null_ls.builtins.code_actions.statix,
  --null_ls.builtins.code_actions.ts_node_action,
    -- Mantener para otras acciones de código
  -- hover
  null_ls.builtins.hover.dictionary 
}

-- LSP setup y otras configuraciones aquí...

null_ls.setup({
  sources = sources,
})
