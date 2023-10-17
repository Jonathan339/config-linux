return {
    "stevearc/dressing.nvim",
    opts = {
        input = {win_options = {winhighlight = "NormalFloat:DiagnosticError"}}
    },

    config = function(opts) require("dressing").setup(opts) end
}
