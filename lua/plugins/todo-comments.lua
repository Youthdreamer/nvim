return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "User LazyFile",
	opts = {
		signs = false,
	},
	keys = {
		{
			"<leader>ft",
			function()
				local ok, _ = pcall(require, "todo-comments")
				if not ok then
					vim.notify(
						"todo-comments 未加载，请检查插件是否启用",
						vim.log.levels.WARN,
						{ title = "Todo" }
					)
					return
				end

				vim.cmd("Telescope todo-comments todo theme=dropdown")
			end,
			desc = "TODO查询",
		},
	},
}
