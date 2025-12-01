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
				file_icons = {
					enabled = true,
				},
				git_status = {
					symbols = {
						added = " ", -- 新增
						modified = "  ", -- 修改
						deleted = "󱂥 ", -- 删除
						renamed = "󰑕 ", -- 重命名
						untracked = " ", -- 未跟踪
						unstaged = " ", -- 未暂存
						staged = "󰩍 ", -- 已暂存
						ignored = "  ", -- 忽略
						conflict = " ", -- 冲突（更醒目）
					},
				},
			},
		},
	},
}
