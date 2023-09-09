local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then return end
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = "nvim_lsp", priority = 1000, keyword_length = 1 }, -- Muestra sugerencias basadas en la respuesta de un servidor LSP
    { name = "luasnip",  priority = 750,  keyword_length = 2 }, -- Muestra los snippets cargados. Si elegimos un snippet lo expande
    { name = "buffer",   priority = 500,  keyword_length = 3 }, -- Sugiere palabras que se encuentra en el archivo actual
    { name = "path",     priority = 250 },                      -- Autocompleta rutas de archivos
  },
  mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})
