return {
	"folke/which-key.nvim",
	event = "BufReadPost",
	lazy = true,
	opts = {
		preset = "helix", -- 可选 "classic", "modern", "helix"
		win = {
			-- col = -1, -- 右侧80%位置
			col = math.huge, -- 将弹窗定位到屏幕最右侧
			row = -1, -- 将弹窗定位到屏幕最顶端
			-- row = -1, -- 底部80%位置
			width = 30, -- 宽度30%
			height = 20, -- 高度40%
			border = "rounded", -- 圆角边框
			padding = { 1, 1 },
			title = true, -- 不显示标题
			title_pos = "center",
			no_overlap = false, -- 允许重叠
			wo = {
				winblend = 10, -- 10%透明度
			},
		},
		layout = {
			width = { min = 20, max = 40 },
			spacing = 3,
		},
		show_help = false,
		show_keys = true,
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>e", group = "文件管理" },

			{ "<leader>f", group = " 文件/查找" },
			{ "<leader>fn", "<cmd>enew<cr>", desc = "新建文件", mode = { "n" } },

			{ "<leader>t", group = " 终端" },

			{ "<leader><tab>", group = " 标签栏" },

			{ "<leader>-", "<cmd>split<cr>", desc = "下方分割窗口" },
			{ "<leader>|", "<cmd>vsplit<cr>", desc = "右侧分割窗口" },

			{ "<leader>H", group = " 帮助/历史" },
			{ "<leader>Hh", "<cmd>Telescope help_tags<cr>", desc = "查找帮助" },
			{ "<leader>Hc", "<cmd>Telescopcommands<cr>", desc = "命令历史" },
			{ "<leader>Hk", "<cmd>Telescope keymaps<cr>", desc = "查看键位映射" },

			{ "<leader>w", group = " 窗口操作" }, -- 这是一个组
			{ "<leader>ww", "<C-w>w", desc = "切换其他窗口" },
			{ "<leader>wd", "<C-w>c", desc = "删除当前窗口" },
			{ "<leader>ws", "<cmd>split<cr>", desc = "下方分割窗口" },
			{ "<leader>wv", "<cmd>vsplit<cr>", desc = "右方分割窗口" },
			{ "<leader>wh", "<C-w>h", desc = "跳转到左方窗口" },
			{ "<leader>wl", "<C-w>l", desc = "跳转到右方窗口" },
			{ "<leader>wj", "<C-w>j", desc = "跳转到下方窗口" },
			{ "<leader>wk", "<C-w>k", desc = "跳转到上方窗口" },

			{ "<leader>b", group = " 缓冲区操作" },
			{ "<leader>b[", "<cmd>bprevious<cr>", desc = "上一个缓存区" },
			{ "<leader>b]", "<cmd>bnext<cr>", desc = "下一个缓存区" },
			{ "<leader>bd", "<cmd>bdelete<cr>", desc = "关闭当前缓存区" },
			{ "<leader>bb", "<cmd>e #<cr>", desc = "切换到其他缓存区" },

			{ "<leader>c", group = " LSP操作" },
			{ "<leader>j", group = " 代码快捷跳转" },
			{ "<leader>d", group = " 代码诊断" },
			{ "<leader>g", group = " Git操作" },
			{ "<leader>h", group = " Git Hunk/信息" },
			{ "<leader>m", group = " 文件标记跳转" },
			{ "<leader>ft", group = " TODO列表" },
			{ "<leader>q", group = " 退出编辑器" },
			{ "<leader>s", group = " 搜索替换" },
			{ "<leader>x", group = " 问题查看" },
			{ "<leader>z", group = " 代码折叠" },
		}, {
			mode = { "n", "v" },
		})
	end,
}
