return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			auto_install = true, -- 缺少解析器时自动安装
			modules = {}, -- 默认为空即可
			sync_install = false, -- 同步安装关闭
			ignore_install = {}, -- 忽略的语言列表
		})
	end,
	-- dependencies = {
	--      "nvim-treesitter/nvim-treesitter-textobjects", -- 强烈推荐安装以获得文本对象和导航
	-- },
}
