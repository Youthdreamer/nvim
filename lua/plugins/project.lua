-- 自动cd到项目目录 project.lua
return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			manual_mode = false, -- 如果设置为 true，则需要手动 `ProjectRoot` 命令
			exclude_dirs = {}, -- 排除某些目录不作为项目
			detection_methods = { "lsp", "pattern", "parent" }, -- lsp 优先，然后是模式匹配，最后是父目录向上查找
			patterns = {
				".git",
				"Makefile",
				"package.json",
				"pyproject.toml",
				"Cargo.toml",
				".project-root",
				"lazy-lock.json",
			},
			-- 可以在这里定义一个自定义函数来查找根目录
			-- root_dir = function() return vim.fs.root(0, { '.git', 'Cargo.toml' }) end,
			auto_cd = true,
		})
	end,
}
