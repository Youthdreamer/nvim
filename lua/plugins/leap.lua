-- lua/plugins/leap.lua快速、高效的光标跳转
return {
	"ggandor/leap.nvim",
	-- 这行很重要！它告诉 lazy.nvim 只有当你调用 ':Leap' 命令或映射的快捷键时才加载插件。
	cmd = "Leap",
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("leap").leap({
					target_windows = { vim.api.nvim_get_current_win() }, -- 确保只在当前窗口
					include_current_line = true, -- **让 Leap 查找整个屏幕**
				})
			end,
			desc = "Leap: 向下跳转",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				local windows = require("leap.util").get_enterable_windows()
				require("leap").leap({
					target_windows = windows,
					include_current_line = true, -- 让 Leap 在每个窗口都查找整个屏幕
				})
			end,
			desc = "Leap: 跨窗口跳转",
		},
		{
			"gs",
			mode = { "n", "x", "o" },
			function()
				require("leap").leap({ backward = true })
			end,
			desc = "Leap：向上跳转",
		},
	},
}
