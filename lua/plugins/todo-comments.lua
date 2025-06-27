return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufReadPost", -- 在读取缓冲区后加载，以确保所有 TODO 注释被识别
	opts = {
		signs = false,
	},
	keys = {
		{ "<leader>ftt", "<cmd>TodoTrouble<CR>", desc = "打开所有TODO注释 (Trouble)" },
		{ "<leader>ftq", "<cmd>TodoQuickfix<CR>", desc = "打开所有TODO注释 (Quickfix)" },
	},
}
