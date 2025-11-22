-- 格式化插件
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local registry = require("mason-registry")
		-- 根据自己的工具和语言，扩展映射表
		local mason_managed_formatters_by_ft = {
			lua = { "stylua" }, -- 使用 stylua 格式化 Lua 代码
			-- rust = { "rustfmt" }, -- 不推荐使用Mason安装的rustfmt格式化工具，推荐的时rustup安装
			-- rust = {}, -- 不使用Mason安装的工具，所以这里设置为空，不会被Mason下载，战而使用lsp自带的格式化工具
			-- 使用自定义格式化工具，这是Mason管理的工具，类似于这rust，见下表
			toml = { "taplo" },
			-- python的格式化查看下面的自维护列表 (custom_formatters_by_ft)
			-- python = { "ruff" },
			-- python = { "black", "isort" },
			go = { "goimports" }, -- 包含gofmt的功能，附带import的管理
			javascript = { "eslint_d", "prettierd" }, -- 使用 prettier 格式化 JavaScript
			typescript = { "eslint_d", "prettierd" },
			javascriptreact = { "eslint_d", "prettierd" },
			typescriptreact = { "eslint_d", "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			html = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			json = { "jq" }, -- 使用 jq 格式化 JSON
		}

		-- 非Mason管理的格式化工具自维护表，专门设置Mason不支持格式化工具
		local custom_formatters_by_ft = {
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
			-- go = { "gofmt" }, -- go安装时附带安装，但是goimports会更好
		}

		-- 返回一个去重的格式化工具列表
		local function get_all_formatters_for_mason()
			local all_formatters = {}
			for _, formatter_list in pairs(mason_managed_formatters_by_ft) do
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
		-- 检查格式化工具列表，并安装。
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

		-- 接受格式化工具列表
		local mason_install_list = get_all_formatters_for_mason()
		is_installed_formatter_list(mason_install_list)

		-- 合并两个格式化工具表
		-- 这个最终的表将包含所有 conform.nvim 需要使用的格式化器
		local final_formatters_config = vim.deepcopy(mason_managed_formatters_by_ft) -- 复制 Mason 管理的表作为基础

		for ft, formatters in pairs(custom_formatters_by_ft) do
			if final_formatters_config[ft] then
				-- 如果文件类型已存在，将自定义格式化器追加到列表末尾
				-- 这意味着 Mason 管理的工具会优先尝试
				for _, formatter in ipairs(formatters) do
					table.insert(final_formatters_config[ft], formatter)
				end
			else
				-- 如果文件类型不存在，直接添加
				final_formatters_config[ft] = formatters
			end
		end

		local opts = {
			formatters_by_ft = final_formatters_config,
			format_on_save = {
				timeout_ms = 500, -- 格式化超时时间（毫秒）
				lsp_fallback = true, -- 如果没有可用的格式化器，使用 LSP 格式化
			},
		}
		require("conform").setup(opts)
	end,
}
