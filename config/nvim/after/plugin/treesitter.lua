local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then return end

treesitter.setup({
  -- A list of parser names, or "all"
   ensure_installed = {
                    "javascript",
                    "typescript",
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "elixir",
                    "erlang",
                    "heex",
                    "eex",
                    "java",
                    "kotlin",
                    "jq",
                    "dockerfile",
                    "json",
                    "html",
                    "terraform",
                    "go",
                    "tsx",
                    "bash",
                    "ruby",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
})
     
