-- 这是一个精简版配置，只保留信息显示和导航功能
return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost", -- 在文件读取后加载，这样能更快看到 Git 标记
	dependencies = {
		"nvim-lua/plenary.nvim", -- gitsigns 依赖 plenary.nvim
	},
	config = function()
		require("gitsigns").setup({
			-- 默认的 Git 标记样式，你可以根据喜好修改字符
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = { -- 已暂存文件的标记样式，与未暂存的区分开
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true, -- 启用已暂存文件的标记
			signcolumn = true, -- 始终显示 Git 标记列（左侧的修改标识）
			numhl = false, -- 不高亮行号
			linehl = false, -- 不高亮整行
			word_diff = false, -- 默认不启用行内单词级别的差异高亮，可以通过快捷键切换
			watch_gitdir = {
				follow_files = true, -- 自动跟踪文件移动/重命名
			},
			auto_attach = true, -- 自动为 Git 仓库中的文件启用 gitsigns
			attach_to_untracked = false, -- 不为未跟踪文件显示标记
			current_line_blame = true, -- 默认不在当前行显示 Git blame 信息，可以通过快捷键切换
			current_line_blame_opts = {
				virt_text = true, -- 使用虚拟文本显示 blame 信息
				virt_text_pos = "eol", -- 在行尾显示 blame 信息 ('eol' | 'overlay' | 'right_align')
				delay = 500, -- 鼠标悬停显示 blame 信息的延迟（毫秒）
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>", -- blame 信息格式
			sign_priority = 6, -- 标记的显示优先级
			update_debounce = 100, -- 更新 Git 状态的去抖动时间（毫秒）
			status_formatter = nil, -- 使用默认的状态行格式化器
			max_file_length = 40000, -- 如果文件行数超过此值，则禁用 gitsigns，以提高性能
			preview_config = { -- 预览 Hunk 时的浮动窗口配置
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},

			-- 键位映射 (Keymaps) - 只保留信息显示和导航相关的映射
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				-- 辅助函数：简化键位映射的定义
				local function map(mode, l, r, desc, opts)
					opts = opts or {}
					opts.buffer = bufnr -- 将映射绑定到当前缓冲区
					if desc then
						opts.desc = desc -- 添加描述，便于查看键位绑定
					end
					vim.keymap.set(mode, l, r, opts)
				end

				-- --- 导航 (Navigation) ---
				-- 在 Hunk 之间跳转：
				-- `]c` 跳转到下一个修改块 (hunk)
				-- 如果在 diff 模式下，则使用 Neovim 原生 `]c` 跳转到下一个更改
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "跳转到下一个修改块")

				-- `[c` 跳转到上一个修改块 (hunk)
				-- 如果在 diff 模式下，则使用 Neovim 原生 `[c` 跳转到上一个更改
				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "跳转到上一个修改块")

				-- --- 信息查看 (Information Viewing) ---
				map("n", "<leader>hp", gitsigns.preview_hunk, "预览Hunk(弹窗)")
				map("n", "<leader>hi", gitsigns.preview_hunk_inline, "行内预览Hunk")
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, "显示blame弹窗信息")
				map("n", "<leader>hd", gitsigns.diffthis, "显示文件差异(索引)")
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~") -- '~' 表示 HEAD 的父提交
				end, "显示文件差异(HEAD)")
				map("n", "<leader>hQ", function()
					gitsigns.setqflist("all")
				end, "所有Git变更到Quickfix")
				map("n", "<leader>hq", gitsigns.setqflist, "当前文件变更到Quickfix")

				-- --- 切换显示 (Toggles) ---
				map("n", "<leader>ht", gitsigns.toggle_current_line_blame, "切换行内blame显示")
				map("n", "<leader>hw", gitsigns.toggle_word_diff, "切换行内单词差异")

				-- --- 文本对象 (Text object) ---
				map({ "o", "x" }, "ih", gitsigns.select_hunk, "选择Git hunk")
			end,
		})
	end,
}
