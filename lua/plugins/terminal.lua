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
			vim.keymap.set("n", "<leader>t1", "<Cmd>1ToggleTerm<CR>", { desc = "终端1" })
			vim.keymap.set("n", "<leader>t2", "<Cmd>2ToggleTerm<CR>", { desc = "终端2" })
			vim.keymap.set("n", "<leader>t3", "<Cmd>3ToggleTerm<CR>", { desc = "终端3" })
			vim.keymap.set("n", "<leader>tq", "<Cmd>ToggleTermCloseAll<CR>", { desc = "关闭全部终端" })

			-- 终端中操作
			vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "普通模式" }) -- 退出终端插入模式

			-- 如果你想创建多个独立的终端会话，可以定义不同的函数
			function _G.set_terminal_commands()
				-- 设置一个Git命令终端
				vim.api.nvim_create_user_command("TermGit", function()
					require("toggleterm.terminal").Terminal
						:new({
							cmd = "lazygit", -- 例如，使用 lazygit
							direction = "float",
							hidden = true,
							size = 0.8,
						})
						:toggle()
				end, { desc = "Open Git Terminal" })
			end
			_G.set_terminal_commands() -- 调用函数来定义这些用户命令

			vim.keymap.set("n", "<leader>tg", "<cmd>TermGit<cr>", { desc = "Git 终端 (lazygit)" })
		end,
	},
}
