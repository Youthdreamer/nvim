return {
	"akinsho/bufferline.nvim",
	event = "User LazyFile",
	-- 插件依赖
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- 用于显示文件图标，强烈推荐安装
	opts = {
		options = {
			always_show_bufferline = true, -- 总是显示 bufferline，即使只有一个 buffer
			buffer_close_icons = "⨉ ", -- 关闭 buffer 的图标，Nerd Font
			close_icon = "⨉ ", -- Tabline 右侧的关闭所有 buffer 图标
			diagnostics = "nvim_lsp", -- 显示 LSP 诊断信息，可选 "nvim_lsp", "coc", "default"
			diagnostics_indicator = function(count, level)
				-- 自定义诊断图标和颜色
				local icon = level:match("error") and " " or " " -- 错误用实心圆，其他用空心圆
				return " " .. icon .. count
			end,
			enforce_regular_tabs = true, -- 强制使用常规标签页样式
			indicator = {
				style = "underline", -- 下划线，可选 "underline", "none"
			},
			left_trunc_marker = "", -- 左侧截断标记，Nerd Font
			right_trunc_marker = "", -- 右侧截断标记，Nerd Font
			modified_icon = "●", -- 未保存文件的修改指示器图标，Nerd Font
			max_average_window_width = 100, -- 平均窗口宽度限制，防止 buffer 过多时挤压
			numbers = "none", -- buffer 编号显示，可选 "none", "ordinal", "buffer_id", "custom"
			-- 自定义诊断颜色 (取决于你的 colorscheme)
			-- diagnostics_indicator = function(count, level)
			--   if level:match("error") then
			--     return " " .. vim.fn.sign_getdefined("DiagnosticSignError")[1].text .. count
			--   elseif level:match("warn") then
			--     return " " .. vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text .. count
			--   end
			--   return " " .. count
			-- end,
			show_buffer_close_icons = true, -- 是否显示每个 buffer 上的关闭图标
			show_close_icon = true, -- 是否显示 Tabline 右侧的关闭所有 buffer 图标
			show_tab_indicators = true, -- 是否显示 Tabline 上方的指示器
			sort_by = "insert_after_current", -- buffer 排序方式，可选 "insert_after_current", "id", "extension", "relative_directory", "tabs"
			offsets = {
				{
					filetype = "NvimTree", -- 文件树，如 Neo-tree 窗口左侧的偏移
					text = "项目目录", -- 可以在这里显示文本
					text_align = "left",
					separator = true, -- 是否显示分隔符
					padding = 1,
				},
				{
					filetype = "neo-tree", -- Neo-tree 的文件类型
					text = "目录",
					text_align = "left",
					separator = true,
					padding = 1,
				},
			},
		},
	},
	keys = {
		{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "切换到下一个缓冲区" },
		{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "切换到上一个缓冲区" },
		{ "<leader>bb", "<cmd>e #<cr>", desc = "快速切换缓冲区" },
		{ "<leader>bd", "<cmd>bdelete<cr>", desc = "删除缓冲区" },
		{ "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "查询并跳转缓冲区" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "删除其他缓冲区" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "切换缓冲区固定状态" },
		{
			"<leader>bP",
			"<cmd>BufferLineGroupClose ungrouped<cr>",
			desc = "删除未固定的缓冲区",
		},
	},
}
