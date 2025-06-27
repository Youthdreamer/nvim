--LSP配置文件
--[[  
    Neovim-LSP服务简单介绍
    1. 设置整个LSP的语言配置对照表，供给给nvim-lspconfig与mason-lspconfig使用
    2. mason-lspconfig的配置无需太多的配置，只需要lsp的名字与一些文档中的其他配置，不使用lsp的自定义配置
    3. nvim-lspconfig的配置需要mason-lspconfig充当桥梁,将lsp服务器注册到nvim-lspconfig简化配置
    总结：首先安装mason.nvim管理安装lsp服务器，使用mason-lspconfig将lsp注册到nvim-lspconfig，
        之后将lsp的配置给到nvim内置的lsp客户端完成代码补全之类的功能

    补充：维护本文件的lsp服务器列表，打开文件即可自动下载，也可不写入列表直接使用MasonInstall 安装相关的lsp服务器。
        格式化工具安装进入"plugins/conform.lua"文件中维护格式化工具列表。
]]
return {
	"mason-org/mason.nvim",
	-- 这个插件依赖于 mason.nvim 和 nvim-lspconfig
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)
		-- 1. 诊断配置（放在最顶部）
		vim.diagnostic.config({
			-- virtual_text = false,
			virtual_text = true,

			signs = {
				active = true,
				text = {
					[vim.diagnostic.severity.ERROR] = "✖",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "💡",
				},
			},
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				border = "rounded",
			},
		})
		-- local lspconfig = require('lspconfig')
		local mason_lspconfig = require("mason-lspconfig")

		--------------- 自维护LSP列表---------------
		-- 需要什么LSP，写入什么LSP的配置
		local servers = {
			["lua_ls"] = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			},
			["pyright"] = {},
			["html"] = {},
			["cssls"] = {},
			["ts_ls"] = {},
			["emmet_ls"] = {},
			["tailwindcss"] = {},
			["rust_analyzer"] = {
				rustfmt = {
					enable = true,
				},
				formatOnsave = {
					enable = true,
				},
			},
		}

		-- 收集所有 LSP 服务器的名称到 ensure_installed 列表中
		local installed_servers = vim.tbl_keys(servers)
		mason_lspconfig.setup({
			-- 阻止 Neovim 在仅仅查看文件时自动下载 LSP 服务器
			automatic_installation = false,
			-- 【日常开发】所需的所有 LSP 服务器,自维护LSP列表servers
			ensure_installed = installed_servers, -- 将收集到的列表赋值给 ensure_installed
		})

		-- 定义通用的 on_attach 函数，用于绑定 LSP 快捷键和设置客户端行为
		local on_attach = function(client, bufnr)
			-- 打印信息用于调试，了解哪个 LSP 客户端连接了
			-- vim.notify("已连接 LSP 客户端: " .. client.name, vim.log.levels.INFO)
			-- 禁用 LSP 内置的文档格式化（如果你使用外部格式化工具）
			vim.lsp.handlers["client"] = nil
			--[[
                未来当Mason不支持的格式化的工具下载的，
                使用LSP的格式化工具时
                在"plugins/conform.lua"文件中维护非Mason管理的格式化工具列表。
            ]]
			-- 这里两个禁止lsp的格式化，只是用格式化工具提供的格式化，放置lsp与格式化的冲突
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end

		-- 配置 nvim-lspconfig 如何处理每个 LSP 服务器 (核心自动化部分)
		for server_name, server_opts in pairs(servers) do
			local final_config = vim.tbl_deep_extend("force", server_opts, {
				on_attach = on_attach,
			})
			vim.lsp.enable(server_name)
			vim.lsp.config(server_name, final_config)
		end
	end,
	keys = {
		{ "<leader>cR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "重命名符号" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "LSP 代码操作" },
		{ "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "LSP 悬浮信息" },
		{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "签名帮助" },

		-- 诊断相关快捷键
		{ "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "显示诊断信息 (浮窗)" },
		{ "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "上一个诊断" },
		{ "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "下一个诊断" },

		-- 代码跳转等功能
		{ "<leader>jd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "定义跳转" },
		{ "<leader>jD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "声明跳转" },
		{ "<leader>ji", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "实现跳转" },
		{ "<leader>jr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "引用查找" },
	},
}
