return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x", -- 确保使用 v3.x 分支以获取最新功能和视觉效果
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- 用于文件图标
			"MunifTanjim/nui.nvim", -- Neotree 的 UI 库
			-- 'famiu/bufdelete.nvim',      -- 可选，用于更好地处理缓冲区删除
		},
		cmd = "Neotree", -- 延迟加载，当你执行 :Neotree 命令时加载
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "文件树 (Neotree)" },
		},
		opts = {
			window = {
				border = "rounded",
				position = "left", -- 默认左侧打开
				width = 30, -- 默认宽度
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false, -- 是否隐藏 . 开头的文件（你可以设置为 true）
					hide_hidden = false, -- 是否隐藏 Neotree 认为的隐藏文件
					hide_excluded_files = false, -- 是否隐藏 .gitignore 等文件中排除的文件
				},
				follow_current_file = {
					enabled = true, -- 自动展开并选中当前文件
				},
				group_empty_dirs = true, -- 将空目录合并显示
				hijack_netrw = true, -- 接管 Neovim 内置的 netrw
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				container = {
					enable_character_border = true, -- 使用字符边框，看起来更现代
					top_padding = 0,
					bottom_padding = 0,
					right_padding = 0,
					left_padding = 0,
					padding_char = " ",
				},
				file_icons = {
					enabled = true,
					-- 更多图标设置
				},
				git_status = {
					symbols = {
						-- 自定义 Git 状态的符号
						added = "✚",
						modified = "",
						untracked = "",
						deleted = "✖",
						ignored = "M",
						staged = "",
						conflict = "",
					},
				},
			},
			-- 如果你想启用浮动窗口：
			document_symbols = {
				float_preview_width = 80,
				float_preview_height = 20,
				float_preview_left = true,
				show_diagnostics = true,
			},
			-- 更多配置选项请参考 Neotree 的文档
		},
	},
}
