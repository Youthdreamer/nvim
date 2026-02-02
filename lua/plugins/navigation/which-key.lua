return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix", -- 可选 "classic", "modern", "helix"
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>e", group = " Neotree", icon = "" },
			{ "<leader>f", group = "文件查找", icon = "󰈞" },
			{ "<leader>t", group = "终端", icon = "" },
			{ "<leader><tab>", group = "标签栏", icon = "󰓩" },
			{ "<leader>H", group = " 帮助/历史", icon = "" },
			{ "<leader>w", group = "窗口操作", icon = "" },
			{ "<leader>b", group = "缓冲区操作", icon = "" },
			{ "<leader>T", group = " 主题切换", icon = "" },
			{ "<leader>c", group = "LSP操作", icon = "" },
			{ "<leader>D", group = " 诊断浮窗", icon = "" },
			{ "<leader>g", group = "Git操作", icon = "" },
			{ "<leader>h", group = "Git Hunk/信息", icon = "" },
			{ "<leader>m", group = "文件标记跳转", icon = "󰃀" },
			{ "<leader>q", group = "退出编辑器", icon = "󰩈" },
			{ "<leader>x", group = "问题查看", icon = "" },
			{ "<leader>o", group = "专注面板", icon = "" },
			{ "<leader>p", group = " 文档内容预览(typ/md)", icon = "󰈈" },
		}, {
			mode = { "n", "v" },
		})
	end,
}
