local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")

-- Configuración para nvim-notify
vim.notify = require('notify')

require("notify").setup { 
  --icons = nonicons_extention.icons,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  display = "compact",
  stages = 'static',
  background_colour = 'Normal',
  timeout = 10000,
}
--vim.g.notify_icon = '' -- Reemplaza '' con el código de icono correspondiente de tu fuente instalada
--vim.notify("Advertencia: Se detectó un problema", "warn")
--vim.notify("¡Operación completada con éxito!", "info")
--vim.notify("¿Desea guardar los cambios?", "question", {buttons = {"Sí", "No", "Cancelar"}})

-- Función para mostrar el resultado de una operación
function show_result(result)
  -- Convierte el resultado en una cadena de texto
  local message = "El resultado es: " .. tostring(result)
  -- Muestra la notificación con el mensaje
  vim.notify(message)
end

local resultado = 10 + 20
--show_result(resultado)
