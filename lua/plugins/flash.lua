return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash跳转",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter跳转",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "远程跳转",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter搜索",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "切换Flash搜索",
		},
		{
			"gl",
			mode = { "o", "n", "x" },
			function()
				require("flash").jump({
					search = { mode = "search", max_length = 0 },
					label = { after = { 0, 0 } },
					pattern = "^",
				})
			end,
			desc = "跳转行",
		},
	},
}
