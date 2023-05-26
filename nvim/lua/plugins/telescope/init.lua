-- Configuración de Telescope
require('telescope').setup {
    defaults = {
        --theme = "dropdown", -- Otros valores posibles: "cursor", "ivy"
        theme = "ivy", -- Otros valores posibles: "cursor", "ivy"
        mappings = {
            i = {
                ["<C-j>"] = require('telescope.actions').move_selection_next,
                ["<C-k>"] = require('telescope.actions').move_selection_previous,
            },
        },
    },
}


