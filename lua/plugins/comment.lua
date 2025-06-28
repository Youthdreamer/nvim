-- 注释插件 comment.lua
return {
	"numToStr/Comment.nvim",
	event = "BufReadPost",
	config = function()
		require("Comment").setup({
			-- 启用/禁用键位绑定
			toggler = {
				line = "gcc", -- 切换行注释
				block = "gbc", -- 切换块注释
			},
			-- 在可视模式下注释
			opleader = {
				line = "gc", -- 注释行
				block = "gb", -- 注释块
			},
			-- 如果设置为 true，则使用键入模式注释而非正常模式
			extra = {
				above = "gcO", -- 在上方添加注释
				below = "gco", -- 在下方添加注释
				eol = "gcA", -- 在行尾添加注释
			},
			-- 是否自动缩进
			pre_hook = nil,
			post_hook = nil,
		})
	end,
	keys = {
		{
			"<leader>/",
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			desc = "行注释-n",
			mode = "n", -- 普通模式
		},
	},
}
