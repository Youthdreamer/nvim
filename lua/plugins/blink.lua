-- 代码不全插件 blink.lua
return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	event = "InsertEnter", -- 进入插入模式时加载
	opts = {
		completion = {
			menu = { border = "rounded" },
			documentation = {
				window = {
					border = "rounded",
				},
				auto_show = true,
			},
		},
		signature = {
			window = {
				border = "rounded",
			},
		},

		keymap = {
			preset = "super-tab",
			["<CR>"] = { "accept", "fallback" },
		},

		sources = {
			default = { "path", "snippets", "buffer", "lsp" },
		},
		cmdline = {
			sources = function()
				local cmd_type = vim.fn.getcmdtype()
				if cmd_type == "/" then
					return { "buffer" }
				end
				if cmd_type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
			keymap = {
				preset = "super-tab",
			},
		},
	},
}
