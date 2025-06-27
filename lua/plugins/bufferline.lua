-- ~/.config/nvim/lua/plugins/bufferline.lua (或者你统一的 plugins 文件)

return {
	"akinsho/bufferline.nvim",
	-- `event = "BufReadPost"` 是一个很好的延迟加载事件，
	-- 它会在读取文件后加载，确保缓冲区显示正常。
	event = "BufReadPost",
	-- 插件依赖
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- 用于显示文件图标，强烈推荐安装
	opts = {
		options = {
			-- basic_style = { fg = { guifg = '#a9b1d6' }, bg = { guibg = '#1a1b26' } }, -- 你可以自定义基础样式
			-- buffer_selected_background_color = '#333642', -- 选中 buffer 的背景色
			-- buffer_selected_foreground_color = '#a9b1d6', -- 选中 buffer 的前景色
			-- separator_style = "slant", -- 分隔符样式，可选 "slant", "padded_slant", "solid", "thin", "none"
			-- separator_style = "thin",  -- 简洁的细线分隔符
			indicator = { -- 选中 buffer 时的指示器样式
				style = "underline", -- 下划线，可选 "underline", "none"
				-- style = 'icon',          -- 也可以用图标，但可能需要更多配置
				-- icon = '▎',
			},
			buffer_close_icons = "", -- 关闭 buffer 的图标，Nerd Font
			modified_icon = "●", -- 未保存文件的修改指示器图标，Nerd Font
			close_icon = "", -- Tabline 右侧的关闭所有 buffer 图标
			left_trunc_marker = "", -- 左侧截断标记，Nerd Font
			right_trunc_marker = "", -- 右侧截断标记，Nerd Font
			max_average_window_width = 100, -- 平均窗口宽度限制，防止 buffer 过多时挤压
			diagnostics = "nvim_lsp", -- 显示 LSP 诊断信息，可选 "nvim_lsp", "coc", "default"
			diagnostics_indicator = function(count, level)
				-- 自定义诊断图标和颜色
				local icon = level:match("error") and " " or "● " -- 错误用实心圆，其他用空心圆
				return " " .. icon .. count
			end,
			-- 自定义诊断颜色 (取决于你的 colorscheme)
			-- diagnostics_indicator = function(count, level)
			--   if level:match("error") then
			--     return " " .. vim.fn.sign_getdefined("DiagnosticSignError")[1].text .. count
			--   elseif level:match("warn") then
			--     return " " .. vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text .. count
			--   end
			--   return " " .. count
			-- end,
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
			show_buffer_close_icons = true, -- 是否显示每个 buffer 上的关闭图标
			show_close_icon = true, -- 是否显示 Tabline 右侧的关闭所有 buffer 图标
			show_tab_indicators = true, -- 是否显示 Tabline 上方的指示器
			enforce_regular_tabs = true, -- 强制使用常规标签页样式
			always_show_bufferline = true, -- 总是显示 bufferline，即使只有一个 buffer
			sort_by = "insert_after_current", -- buffer 排序方式，可选 "insert_after_current", "id", "extension", "relative_directory", "tabs"
			numbers = "ordinal", -- buffer 编号显示，可选 "none", "ordinal", "buffer_id", "custom"
			-- buffer_selected_background_color = '#282a36', -- 选中 buffer 的背景色
			-- buffer_selected_foreground_color = '#f8f8f2', -- 选中 buffer 的文本颜色
		},
	},
	keys = {
		{ "[b", ":BufferLineCyclePrev<CR>", { silent = true, desc = "上一个缓冲区 (Bufferline)" } },
		{ "]b", ":BufferLineCycleNext<CR>", { silent = true, desc = "下一个缓冲区 (Bufferline)" } },
	},
}
