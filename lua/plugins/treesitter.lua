return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			-- 启用功能
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- 初始化选择
					node_incremental = "grn", -- 增加到父节点
					node_decremental = "grm", -- 缩小到子节点
					scope_incremental = "grc", -- 扩展到作用域
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer", -- 外部函数块
						["if"] = "@function.inner", -- 内部函数块
						["ac"] = "@class.outer", -- 外部类块
						["ic"] = "@class.inner", -- 内部类块
					},
				},
			},
			ensure_installed = { -- 自动安装的语言
				"bash",
				"c",
				"cpp",
				"lua",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
			},
			auto_install = true, -- 缺少解析器时自动安装
			-- 解决类型报错字段
			modules = {}, -- 默认为空即可
			sync_install = false, -- 同步安装关闭
			ignore_install = {}, -- 忽略的语言列表
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects", -- 强烈推荐安装以获得文本对象和导航
	},
}
