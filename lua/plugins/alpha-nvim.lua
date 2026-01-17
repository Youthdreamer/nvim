return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
        ██████╗ ██████╗  ██████╗ ██╗  ██╗
       ██╔════╝██╔═══██╗██╔═══██╗██║ ██╔╝
       ██║     ██║   ██║██║   ██║█████╔╝
       ██║     ██║   ██║██║   ██║██╔═██╗
       ╚██████╗╚██████╔╝╚██████╔╝██║  ██╗
        ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
       ┌────────────────────────────────┐
       |        Now, Say My Name.       |
       └────────────────────────────────┘
]]
		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("p", " " .. " 查看项目", "<cmd>Telescope projects<cr>"),
			dashboard.button("f", "󰍉 " .. " 查找文件", "<cmd>Telescope find_files<cr>"),
			dashboard.button("n", " " .. " 新建文件", [[<cmd> ene <BAR> startinsert <cr>]]),
			dashboard.button(
				"s",
				" " .. " 恢复会话",
				[[<cmd> lua require('persistence').load({ last = true }) <cr>]]
			),
			dashboard.button(
				"m",
				" " .. " 查看会话",
				[[<cmd> lua require('persistence').select({ last = true }) <cr>]]
			),
			dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
			dashboard.button("q", "󰗼 " .. " 退出", "<cmd> qa <cr>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 4
		return dashboard
	end,
	config = function(_, dashboard)
		require("alpha").setup(dashboard.opts)

		-- vim.api.nvim_create_autocmd("User", {
		--      once = true,
		--      pattern = "LazyVimStarted",
		--      callback = function()
		--              local stats = require("lazy").stats()
		--              local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		--              dashboard.section.footer.val = "⚡ Neovim 已加载 "
		--                      .. stats.loaded
		--                      .. "/"
		--                      .. stats.count
		--                      .. " 个插件 用时 "
		--                      .. ms
		--                      .. " 毫秒"
		--              pcall(vim.cmd.AlphaRedraw)
		--      end,
		-- })
	end,
}
