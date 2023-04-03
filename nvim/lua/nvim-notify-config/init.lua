require('notify').setup({
  -- Cambiar el método de visualización a "floating"
  display = { 
    floating = { 
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
      focusable = false,
      winblend = 10,
    },
  },
  -- Personalizar la apariencia de las notificaciones
  stages = "fade",
  timeout = 3000,
  -- Usar diferentes configuraciones para diferentes tipos de notificaciones
  errors = {background_colour = "#ff0000", icon = " "},
  warnings = {background_colour = "#ff8800", icon = " "},
  -- Agregar acciones personalizadas a la notificación
  actions = {
    ["Open file"] = function(notification)
      vim.cmd(string.format(":e %s", notification.metadata.filename))
    end
  }
})
