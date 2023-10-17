return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
    cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
            ensure_installed = "all",
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },

            indent = {enable = true},
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil
            }
        })
    end
}
