return {
	"nvim-lualine/lualine.nvim",
	event = "User LazyFile",
	opts = {
		options = {
			component_separators = "",
			disabled_filetypes = {
				statusline = { "dashboard", "alpha", "starter", "neo-tree", "mini-files", "dap-repl" },
				winbar = { "aerial", "dap-repl", "neotest-summary" },
			},
			globalstatus = true,
			section_separators = "",
		},
		sections = {
			lualine_c = { { "filename", path = 1 } },
			lualine_x = {
				function()
					local ft = vim.bo.filetype
					local ts = vim.bo.tabstop
					local sw = vim.bo.shiftwidth
					local et = vim.bo.expandtab and "spaces" or "tab"
					-- 对go语言特别处理
					if ft == "go" then
						return string.format("tab:%d", ts)
					end

					if et then
						return string.format("spaces:%d", sw)
					else
						return string.format("tab:%d", ts)
					end
				end,
				"encoding",
				function()
					local f = vim.bo.fileformat
					if f == "unix" then
						return "LF"
					elseif f == "dos" then
						return "CRLF"
					elseif f == "mac" then
						return "CR"
					else
						return f
					end
				end,
				"fileformat",
				"filetype",
			},
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
