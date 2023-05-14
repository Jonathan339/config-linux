require('lualine').setup {
options = {
  theme = 'nord',
  icons_enabled = true,
},
sections = {
  lualine_a = { {'mode', upper = true} },
  lualine_b = { {'branch', icon = ''} },
  lualine_c = { {'filename', file_status = true, path = 1}, {'coc_status', color = {fg = '#FFFFFF', bg = '#6495ED'}} },
  lualine_x = { 'encoding', 'fileformat', 'filetype' },
  lualine_y = { 'progress', 'diagnostics' },
  lualine_z = { {'location', icon = ''} }
},
extensions = {'fugitive', 'nvim-tree'}
}
require'nvim-web-devicons'.get_icons()
