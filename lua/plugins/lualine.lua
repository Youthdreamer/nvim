return {
	"nvim-lualine/lualine.nvim",
	event = "BufReadPost",
	opts = {
		options = {
			disabled_filetypes = { statusline = {}, winbar = {} },
		},
		sections = {
			lualine_c = {
				{ "filename", path = 1 },
			},
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
