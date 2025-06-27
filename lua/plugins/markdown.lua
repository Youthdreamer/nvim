-- 编写markdown的配置文件-markdown.lua
return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	opts = {
		render_modes = { "n", "c", "t" },
		latex = { enabled = true, converter = "latex2text" },
	},
}
