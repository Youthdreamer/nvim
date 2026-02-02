return {
	"nvim-mini/mini.files",
	version = "*",
	event = "VeryLazy",
	opts = {
		windows = {
			preview = true, -- 打开预览窗口
		},
	},
	keys = {
		{ "-", "<cmd>lua require('mini.files').open()<cr>", desc = "文件管理" },
	},
}
