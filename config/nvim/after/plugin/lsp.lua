local status, cmp = pcall(require, "cmp")
if not status then return end

local status2, luasnip = pcall(require, "luasnip")
if not status2 then return end

require('luasnip.loaders.from_vscode').lazy_load()

local cmp_action = require("lsp-zero").cmp_action()

local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then return end
lsp.preset('recommended')
lsp.ensure_installed = require('utils').servers

local cmp_mappings = {
  ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
  ["<Tab>"] = cmp_action.luasnip_supertab(),
  ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp_mappings,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'codeium' },
    { name = 'buffer', keyword_length = 3 },
    { name = 'path' },
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' },
      },
    },
  }),
}

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()  -- ¡Agregamos la llamada a lsp.setup()!
