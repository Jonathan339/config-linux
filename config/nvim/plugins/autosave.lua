
return {
    -- Nombre del complemento
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- Comando para activar/desactivar el guardado automático
    event = { "InsertLeave", "TextChanged" }, -- Eventos que desencadenarán el guardado automático
    config = {
      enabled = true, -- Activa el guardado automático al inicio
      execution_message = {
        enabled = true,
        message = function()
          return ("AutoSave: guardado a las " .. vim.fn.strftime("%H:%M:%S"))
        end,
      },
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave", "TextChanged" },
        cancel_deferred_save = { "InsertEnter" },
      },
      -- Puedes personalizar más opciones aquí según tus necesidades
    },
  }