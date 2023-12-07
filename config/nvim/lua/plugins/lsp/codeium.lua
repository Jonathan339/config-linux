return {
	"Exafunction/codeium.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", commit = "62d1e2e5691865586187bd6aa890e43b85c00518" },
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({})
	end,
}
