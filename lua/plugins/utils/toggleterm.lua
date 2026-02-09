return {
	"akinsho/toggleterm.nvim",
	version = "*", -- 使用最新的稳定版本，或者指定如 "v2.x"
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 8
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<C-\>]], -- 切换终端的快捷键（例如：Ctrl+\）
			persist_size = true, -- 记住你的终端窗口大小
			direction = "float", -- 默认方向：'vertical'（垂直分割）, 'horizontal'（水平分割）, 'float'（浮动窗口）, 'tab'（新标签页）
			term_width = 120, -- 可以为不同的方向指定宽度
			term_high = 20,
			float_opts = {
				border = "single", -- 浮动窗口边框样式: 'single', 'double', 'circular', 'rounded', 'solid', 'none'
				winblend = 0, -- 浮动窗口的透明度 (0-100)
				height = 20,
				width = 80,
			},
		})
	end,
	keys = {
		{
			"<leader>tt",
			"<cmd>ToggleTerm<cr>",
			desc = "启用终端",
		},
		{
			"<leader>tv",
			"<cmd>ToggleTerm direction=vertical<cr>",
			desc = "切换垂直终端窗口",
		},
		{
			"<leader>th",
			"<cmd>ToggleTerm direction=horizontal<cr>",
			desc = "切换水平终端窗口",
		},
		{
			"<leader>tf",
			"<cmd>ToggleTerm direction=float<cr>",
			desc = "切换浮动终端窗口",
		},
		{
			"<Esc>",
			mode = "t",
			"<C-\\><C-n>",
			desc = "终端退到Normal模式",
		},
	},
}
