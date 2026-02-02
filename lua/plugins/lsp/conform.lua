-- =======================格式化工具说明============================
--[[
            未来当Mason不支持的格式化的工具下载的，
            使用LSP的格式化工具时
            在"plugins/lsp/config/formatters.lua"文件中维护非Mason管理的格式化工具列表。
  ]]
-- =================================================================
-- 格式化插件
return {
	"stevearc/conform.nvim",
	event = "User LazyFile",
	config = function()
		local formatters_list = require("plugins.lsp.config.formatters")
		local mason_managed_formatters_by_ft = formatters_list.mason
		local custom_formatters_by_ft = formatters_list.custom

		-- 合并两个格式化工具表
		-- 这个最终的表将包含所有 conform.nvim 需要使用的格式化器
		local final_formatters_config = vim.deepcopy(mason_managed_formatters_by_ft) --Mason 管理的表作为基础

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
