-- TODO:配置未完成暂停。
return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	opts = { use_diagnostic_signs = true },
	keys = {
		{
			"<leader>xx",
			function()
				require("trouble").toggle("diagnostics")
			end,
			desc = "文件诊断信息(Trouble)",
		},
		{ "<leader>xX", "<cmd>Trouble workspace_diagnostics<cr>", desc = "工作区诊断信息(Trouble)" },
		{ "<leader>xL", "<cmd>Trouble loclist<cr>", desc = "位置列表(Trouble)" },
		{ "<leader>xQ", "<cmd>Trouble quickfix<cr>", desc = "快速修复列表(Trouble)" },
		{
			"[q",
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					vim.cmd.cprev()
				end
			end,
			desc = "Previous trouble/quickfix item",
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
		},
	},
}
