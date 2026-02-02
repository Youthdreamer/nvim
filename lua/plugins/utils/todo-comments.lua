return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
	},
	keys = {
		{
			"<leader>ft",
			"<cmd>Telescope todo-comments todo theme=dropdown<cr>",
			desc = "TODO查询",
		},
	},
}
