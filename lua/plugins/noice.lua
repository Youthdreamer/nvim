-- 消息通知弹窗 Noice.lua
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	lazy = true,
	opts = {
		notify = {
			enabled = true,
		},
		lsp = {
			progress = {
				enabled = false,
				-- enabled = true,
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
