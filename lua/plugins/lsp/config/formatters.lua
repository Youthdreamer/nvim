-- 根据自己的工具和语言，扩展映射表
local M = {}

M.mason = {
	c = { "clang-format" },
	cpp = { "clang-format" },
	lua = { "stylua" }, -- 使用 stylua 格式化 Lua 代码
	javascript = { "eslint_d", "prettierd" },
	typescript = { "eslint_d", "prettierd" },
	javascriptreact = { "eslint_d", "prettierd" },
	typescriptreact = { "eslint_d", "prettierd" },
	css = { "prettierd" },
	scss = { "prettierd" },
	html = { "prettierd" },
	yaml = { "prettierd" },
	markdown = { "prettierd" },
	toml = { "taplo" },
	json = { "prettierd" },
	-- nix = {"alejandra"},
	-- bash = { "shfmt" },
	-- cs = {"csharpier"},
	-- java = {"google-java-format"},
}

-- 非Mason管理的格式化工具自维护表，专门设置Mason不支持格式化工具
M.custom = {
	rust = { "rustfmt" }, -- rust安装时附带安装
	-- ruff在lspconfig中的自维护列表中安装完成
	python = {
		-- 修复可以被 Ruff 自动修复的 lint（代码规范）错误。
		"ruff_fix",
		-- 运行 Ruff 的代码格式化功能。
		"ruff_format",
		-- 整理 import（按规则排序、删除未使用的 import）。
		"ruff_organize_imports",
	},
	-- zig = { "zigfmt" },
	-- go = { "gofmt" }, -- go安装时附带安装，但是goimports会更好
}

-- 返回一个去重的格式化工具列表
local function get_all_formatters_for_mason()
	local all_formatters = {}
	for _, formatter_list in pairs(M.mason) do
		for _, formatter_name in ipairs(formatter_list) do
			all_formatters[formatter_name] = true -- 使用 table 作为 set 去重
		end
	end
	-- 将 table 转回 list
	local result = {}
	for name, _ in pairs(all_formatters) do
		table.insert(result, name)
	end
	return result
end

-- 接受格式化工具列表
M.mason_formatters_list = get_all_formatters_for_mason()

return M
