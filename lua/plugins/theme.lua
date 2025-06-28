-- 安装主题后应该在features文件夹下的theme-list.lua主题列表维护
return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup({
				style = "moon", -- 示例配置：使用 moon 风格
			})
		end,
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin", -- 指定插件名称（避免命名冲突）
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- 示例配置：使用 macchiato 风格
			})
			-- vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		name = "github-theme",
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		name = "gruvbox",
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		name = "kanagawa",
	},
	{
		"shaunsingh/nord.nvim",
		lazy = true,
		name = "nord",
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		name = "nightfox",
	},
}
