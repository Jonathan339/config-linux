--- Configuración de la extensión telescope-file-browser.nvim
local actions = require "telescope._extensions.file_browser.actions"
local devicons = require "nvim-web-devicons"
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      cwd_to_path = false,
      grouped = false,
      files = true,
      add_dirs = true,
      depth = 1,
      auto_depth = false,
      select_buffer = false,
      hidden = { file_browser = false, folder_browser = false },
      dir_icon = devicons.get_icon("folder", { default = true }), -- Cambia el ícono de carpeta
      dir_icon_hl = "Default",
      display_stat = { date = true, size = true, mode = true },
      hijack_netrw = false,
      use_fd = true,
      git_status = true,
      mappings = {
        ["i"] = {
          ["<C-c>"] = actions.create,
          ["<C-R>"] = actions.create_from_prompt,
          ["<C-r>"] = actions.rename,
          ["<C-m>"] = actions.move,
          ["<C-y>"] = actions.copy,
          ["<C-d>"] = actions.remove,
          -- Otros mapeos personalizados para el modo inserción
        },
        ["n"] = {
          ["c"] = actions.create,
          ["r"] = actions.rename,
          ["m"] = actions.move,
          ["y"] = actions.copy,
          ["d"] = actions.remove,
          -- Otros mapeos personalizados para el modo normal
        },
      },
    },
  },
}

-- Cargar la extensión después de configurar
require("telescope").load_extension "file_browser"


-- open file_browser with the path of the current buffer

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

