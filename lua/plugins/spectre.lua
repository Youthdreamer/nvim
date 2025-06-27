return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	-- 插件首次使用时才加载，这里是指定命令
	cmd = "Spectre",
	-- 插件配置选项
	opts = {
		color_devicons = true, -- 是否为文件图标着色
		open_cmd = "vnew", -- 结果在新垂直分屏中打开
		live_update = false, -- 是否实时更新结果 (建议关闭，性能更好)
		lnum_for_results = true, -- 在结果中显示行号
		-- 快捷键绑定
		mapping = {
			["run_replace"] = {
				map = "<leader>R",
				cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
				desc = "replace all",
			},
		},
	},
	keys = {
		-- Leader + s + s: 打开 Spectre 界面
		{ "<leader>ss", "<cmd>Spectre<cr>", desc = "打开 Spectre (全局搜索)" },

		-- Leader + s + w: 搜索当前光标下的单词 (普通模式)
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "搜索当前光标下的单词",
		},

		-- Leader + s + v: 搜索选中的文本 (可视模式)
		{
			"<leader>sv",
			function()
				require("spectre").open_visual()
			end,
			mode = "v", -- 仅在可视模式下生效
			desc = "搜索选中的文本",
		},

		-- Leader + s + f: 在当前文件内搜索光标下的单词 (普通模式)
		{
			"<leader>sf",
			function()
				require("spectre").open_file_search({ select_word = true })
			end,
			desc = "在当前文件搜索 (光标下单词)",
		},
	},
}
