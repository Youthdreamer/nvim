return {
	{
		"akinsho/toggleterm.nvim",
		event = "BufReadPost",
		version = "*", -- 使用最新的稳定版本，或者指定如 "v2.x"
		config = function()
			require("toggleterm").setup({
				-- 分割终端的默认高度/宽度（可以是数字或函数）
				size = function(term)
					if term.direction == "horizontal" then
						return 8
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.3
					end
				end,
				open_mapping = [[<C-\>]], -- 切换终端的快捷键（例如：Ctrl+\）
				persist_size = true, -- 记住你的终端窗口大小
				-- direction = 'float', -- 默认方向：'vertical'（垂直分割）, 'horizontal'（水平分割）, 'float'（浮动窗口）, 'tab'（新标签页）
				term_width = 120, -- 可以为不同的方向指定宽度
				term_high = 20,
				float_opts = {
					border = "curved", -- 浮动窗口边框样式: 'single', 'double', 'circular', 'rounded', 'solid', 'none'
					winblend = 0, -- 浮动窗口的透明度 (0-100)
					height = 20,
					width = 80,
					row = nil, -- 如果为nil，将自动居中
					col = nil,
				},
			})

			-- 为不同方向的终端设置更具体的快捷键（可选）
			vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "浮动终端" })
			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal<cr>",
				{ desc = "水平分割终端" }
			)
			vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "垂直分割终端" })
			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", { desc = "新标签页终端" })

			-- 终端中操作
			vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "普通模式" }) -- 退出终端插入模式
		end,
	},
}
