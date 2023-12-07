local M = {
	"windwp/nvim-autopairs",
	opts = {
		fast_wrap = {},
		disable_filetype = { "TelescopePrompt", "vim" },
	},
}
M.config = function(_, opts)
	require("nvim-autopairs").setup(opts)
end

return M
