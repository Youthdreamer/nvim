return {
	"folke/trouble.nvim",
	cmd = { "Trouble" },
	opts = {},
	keys = {
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right",
			desc = "切换 LSP 定义/引用面板 (Trouble)",
		},
		{
			"<leader>xt",
			"<cmd>Trouble todo toggle<cr>",
			desc = "切换TODO面板 (Trouble)",
		},
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "文件诊断信息(Trouble)",
		},
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "工作区诊断信息(Trouble)" },
		{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "位置列表(Trouble)" },
		{ "<leader>xQ", "<cmd>Trouble quickfix toggle<cr>", desc = "快速修复列表(Trouble)" },
		{
			"[q",
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					vim.cmd.cprev()
				end
			end,
			desc = "上一个故障/快速修复项目",
		},
		{
			"]q",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					vim.cmd.cnext()
				end
			end,
			desc = "下一个故障/快速修复项目",
		},
	},
}
