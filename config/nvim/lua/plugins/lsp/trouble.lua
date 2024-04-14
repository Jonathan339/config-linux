local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
	local trouble = require("trouble")
	trouble.setup({
		position = "bottom", -- posición de la lista puede ser: abajo, arriba, izquierda, derecha
		height = 10, -- altura de la lista de problemas cuando la posición es arriba o abajo
		width = 50, -- anchura de la lista cuando la posición es izquierda o derecha
		icons = true, -- usar devicons para nombres de archivo
		--mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
		severity = nil, -- nil (all) o vim.diagnostic.severity.ERROR | WARN | INFO | HINT
		fold_open = "", -- icono utilizado para pliegues abiertos
		fold_closed = "", -- icono utilizado para pliegues cerrados
		group = true, -- agrupar resultados por archivo
		padding = true, -- agregar una nueva línea adicional en la parte superior de la lista
		cycle_results = true, -- ciclar la lista de elementos al llegar al principio o al final de la lista
		action_keys = { -- asignaciones de teclas para acciones en la lista de problemas
			-- asignar {} para eliminar una asignación, por ejemplo:
			-- close = {},
			close = "q", -- cerrar la lista
			cancel = "<esc>", -- cancelar la vista previa y volver a tu última ventana / buffer / cursor
			refresh = "r", -- refrescar manualmente
			jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- saltar al diagnóstico o abrir / cerrar pliegues
			open_split = { "<c-x>" }, -- abrir buffer en un nuevo split
			open_vsplit = { "<c-v>" }, -- abrir buffer en un nuevo vsplit
			open_tab = { "<c-t>" }, -- abrir buffer en una nueva pestaña
			jump_close = { "o" }, -- saltar al diagnóstico y cerrar la lista
			toggle_mode = "m", -- alternar entre modo de diagnósticos "workspace" y "document"
			switch_severity = "s", -- cambiar el nivel de filtro de severidad "diagnostics" a HINT / INFO / WARN / ERROR
			toggle_preview = "P", -- alternar vista previa automática
			hover = "K", -- abrir un pequeño popup con el mensaje completo de varias líneas
			preview = "p", -- vista previa de la ubicación del diagnóstico
			open_code_href = "c", -- si está presente, abrir un URI con más información sobre el error de diagnóstico
			close_folds = { "zM", "zm" }, -- cerrar todos los pliegues
			open_folds = { "zR", "zr" }, -- abrir todos los pliegues
			toggle_fold = { "zA", "za" }, -- alternar pliegue del archivo actual
			previous = "k", -- elemento anterior
			next = "j", -- siguiente elemento
		},
		multiline = true, -- renderizar mensajes de varias líneas
		indent_lines = true, -- agregar una guía de sangría debajo de los iconos de pliegue
		win_config = { border = "single" }, -- configuración de ventana para ventanas flotantes. Ver |nvim_open_win()|.
		auto_open = false, -- abrir automáticamente la lista cuando tengas diagnósticos
		auto_close = false, -- cerrar automáticamente la lista cuando no tengas diagnósticos
		auto_preview = true, -- vista previa automática de la ubicación del diagnóstico. <esc> para cerrar la vista previa y volver a la última ventana
		auto_fold = false, -- plegar automáticamente una lista de problemas de archivo al crearla
		auto_jump = { "lsp_definitions" }, -- para los modos dados, saltar automáticamente si hay un solo resultado
		include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- para los modos dados, incluir la declaración del símbolo actual en los resultados
		signs = {
			-- iconos / texto usados para un diagnóstico
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
		use_diagnostic_signs = true, -- habilitar esto usará los signos definidos en tu cliente lsp
	})
end
return M
