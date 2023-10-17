return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-git",
        "Exafunction/codeium.nvim", "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim", {"L3MON4D3/LuaSnip", tag = "v1.*"},
        "windwp/nvim-autopairs", "windwp/nvim-ts-autotag"
    },
    config = function()
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local icons = {
            kind = require("utils.icons").get("kind"),
            type = require("utils.icons").get("type"),
            cmp = require("utils.icons").get("cmp")
        }
        -- local lspkind = require("lspkind")
        cmp.event:on("confirm_done",
                     cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

        cmp.setup({
            mapping = {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    local col = vim.fn.col(".") - 1

                    if cmp.visible() then
                        cmp.select_next_item(select_opts)
                    elseif col == 0 or
                        vim.fn.getline("."):sub(col, col):match("%s") then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, {"i", "s"}),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item(select_opts)
                    else
                        fallback()
                    end
                end, {"i", "s"}),
                ["<CR>"] = function(fallback)
                    if cmp.visible() then
                        cmp.confirm()
                    else
                        fallback()
                    end
                end
            },
            sources = cmp.config.sources({
                {name = "nvim_lsp"}, {name = "buffer"},
                {name = "nvim_lsp", max_item_count = 350}, {name = "nvim_lua"},
                {name = "luasnip"}, {name = "path"}, {name = "treesitter"},
                {name = "cmp_git"}, -- { name = "tmux" },
                -- { name = "orgmode" },
                {name = "buffer"}, {name = "codeium"}
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },

            formatting = {
                fields = {"abbr", "kind", "menu"},
                format = function(entry, vim_item)
                    local lspkind_icons =
                        vim.tbl_deep_extend("force", icons.kind, icons.type,
                                            icons.cmp)
                    -- load lspkind icons
                    vim_item.kind = string.format(" %s  %s",
                                                  lspkind_icons[vim_item.kind] or
                                                      icons.cmp.undefined,
                                                  vim_item.kind or "")

                    vim_item.menu = setmetatable({
                        cmp_tabnine = "[TN]",
                        copilot = "[CPLT]",
                        buffer = "[BUF]",
                        orgmode = "[ORG]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[LUA]",
                        path = "[PATH]",
                        tmux = "[TMUX]",
                        treesitter = "[TS]",
                        latex_symbols = "[LTEX]",
                        luasnip = "[SNIP]",
                        spell = "[SPELL]"
                    }, {
                        __index = function()
                            return "[BTN]" -- builtin/unknown source names
                        end
                    })[entry.source.name]

                    local label = vim_item.abbr
                    local truncated_label = vim.fn.strcharpart(label, 0, 80)
                    if truncated_label ~= label then
                        vim_item.abbr = truncated_label .. "..."
                    end

                    return vim_item
                end
            }
        })

        -- Configuración específica para el tipo de archivo "gitcommit"
        cmp.setup.filetype("gitcommit", {
            sources = cmp.config
                .sources({{name = "cmp_git"}}, {{name = "buffer"}})
        })

        -- Utilizar la fuente de búfer para "/"
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{name = "buffer"}}
        })

        -- Utilizar fuentes de línea de comandos y rutas para ":"
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config
                .sources({{name = "path"}}, {{name = "cmdline"}})
        })

        -- Configuración para tipos de archivo "sql", "mysql", "plsql"
        cmp.setup.filetype({"sql", "mysql", "plsql"}, {
            sources = cmp.config.sources({{name = "vim-dadbod-completion"}},
                                         {{name = "buffer"}})
        })
    end
}
