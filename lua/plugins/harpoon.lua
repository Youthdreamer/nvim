--快速跳转功能 harpoon.lua
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
  event = "User LazyFile",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon").setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})
	end,
	keys = {
		{
			"<leader>ma",
			function()
				require("harpoon"):list():add()
			end,
			desc = "添加标记",
		},
		{
			"<leader>md",
			function()
				require("harpoon"):list():remove()
			end,
			desc = "移除标记",
		},

		{
			"<leader>mm",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "切换Harpoon菜单",
		},
		{
			"<leader>m1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "跳转标记1",
		},
		{
			"<leader>m2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "跳转标记2",
		},
		{
			"<leader>m3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "跳转标记3",
		},
		{
			"<leader>m[",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "上一个标记",
		},
		{
			"<leader>m]",
			function()
				require("harpoon"):list():next()
			end,
			desc = "下一个标记",
		},
	},
}
