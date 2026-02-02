return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		anti_conceal = {
			disabled_modes = { "n" },
			ignore = { bullet = true, head_background = true, head_border = true },
		},
		heading = {
			border = true,
			icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
			render_modes = true,
		},
		sign = { enabled = false },
	},
}
