return {
	"mason-org/mason.nvim",
	cmd = "Mason",
	event = { "VeryLazy" },
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local servers = require("plugins.lsp.config.servers")
		local formatters = require("plugins.lsp.config.formatters")
		local mason = require("mason")
		local registry = require("mason-registry")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({})
		-- NOTE: 收集所有 LSP 服务器的名称到 ensure_installed 列表中
		local installed_servers = vim.tbl_keys(servers)
		mason_lspconfig.setup({
			-- 阻止 Neovim 在仅仅查看文件时自动下载 LSP 服务器
			automatic_installation = false,
			-- 【日常开发】所需的所有 LSP 服务器,自维护LSP列表servers
			ensure_installed = installed_servers, -- 将收集到的列表赋值给 ensure_installed
		})

		-- NOTE: 检查格式化工具列表，并安装。
		local function is_installed_formatter_list(formatter_list)
			for _, formatter in pairs(formatter_list) do
				local package = registry.get_package(formatter) -- 获取包实例
				if not registry.is_installed(formatter) then
					if package then
						package:install() -- 安装未安装的包
						vim.notify("正在安装格式化工具: " .. formatter, vim.log.levels.INFO)
					else
						vim.notify("未找到格式化工具: " .. formatter, vim.log.levels.INFO)
					end
				end
			end
		end
		-- 接受格式化工具列表安装
		is_installed_formatter_list(formatters.mason_formatters_list)
	end,
}
