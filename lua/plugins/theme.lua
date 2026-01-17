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
	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = true,
		name = "monokai-pro",
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		name = "onedark",
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = true,
		name = "nordic",
	},
	{
		"Shatur/neovim-ayu",
		lazy = true,
		name = "ayu",
	},
	{
		"vague-theme/vague.nvim",
		lazy = true,
		name = "vague",
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
		name = "dracula",
	},

	{
		"olivercederborg/poimandres.nvim",
		lazy = true,
		name = "poimandres",
	},
}
