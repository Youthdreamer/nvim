return {
	"j-hui/fidget.nvim",
	event = "LspAttach", -- LSP 客户端附加时加载
	config = function()
		require("fidget").setup({
			-- LSP 进度子系统选项
			progress = {
				-- 进度消息的轮询和抑制
				poll_rate = 0, -- 默认值通常是 0，即尽可能快地更新
				suppress_on_insert = true, -- **在插入模式下抑制新消息，避免打字时弹出**
				ignore_done_already = true, -- 忽略已完成的任务
				ignore_empty_message = true, -- 忽略空消息任务
				clear_on_detach = function(client_id)
					local client = vim.lsp.get_client_by_id(client_id)
					return client and client.name or nil
				end,
				notification_group = function(msg)
					return msg.lsp_client.name
				end,
				ignore = {}, -- 要忽略的 LSP 服务器列表

				-- LSP 进度消息如何显示为通知
				display = {
					render_limit = 8, -- **同时显示的最大 LSP 消息数量，减少屏幕占用**
					done_ttl = 2, -- **消息完成后的保留时间（秒），略短一些更简洁**
					done_icon = "✔ ", -- **完成图标，加个空格更好看** (需 Nerd Fonts)
					done_style = "DiagnosticOk", -- 使用诊断成功的亮色
					progress_ttl = math.huge, -- 进度中的消息无限期保留
					progress_icon = { "dots" }, -- 进度图标样式，保持默认点点点
					progress_style = "DiagnosticInfo", -- **进度条颜色，用信息色显得不那么像错误**
					group_style = "LspInfo", -- **LSP 服务器名称的标题样式**
					icon_style = "Keyword", -- **图标高亮样式，用关键字色突出**
					priority = 30, -- 优先级
					skip_history = true, -- 进度通知不进入历史记录
					format_message = require("fidget.progress.display").default_format_message,
					format_annote = function(msg)
						return msg.title
					end,
					format_group_name = function(group)
						return tostring(group)
					end,
					overrides = {
						-- 可以针对特定 LSP 客户端进行覆盖，例如：
						-- rust_analyzer = { name = "rust-analyzer", notification_group = "Rust" },
					},
				},

				-- Neovim 内置 LSP 客户端选项
				lsp = {
					progress_ringbuf_size = 0,
					log_handler = false,
				},
			},

			-- 通知子系统选项
			notification = {
				poll_rate = 10,
				filter = vim.log.levels.INFO, -- 过滤掉 INFO 以下的通知
				history_size = 128,
				-- override_vim_notify = true, -- **强烈建议开启，让所有 vim.notify 都通过 Fidget 显示**
				configs = { default = require("fidget.notification").default_config },
				redirect = function(msg, level, opts)
					if opts and opts.on_open then
						return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
					end
				end,

				-- 通知如何渲染为文本
				view = {
					stack_upwards = true, -- **通知从底部向上堆叠显示，更符合常见通知习惯**
					icon_separator = " ", -- 图标和文本之间的分隔符
					group_separator = "---", -- 组之间的分隔符
					group_separator_hl = "Comment", -- 分隔符高亮
					render_message = function(msg, cnt)
						return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
					end,
				},

				-- 通知窗口和缓冲区选项
				window = {
					normal_hl = "Comment", -- 通知窗口背景的默认高亮组
					-- blend = 0,
					winblend = 80, -- **窗口透明度，略微透明，不完全遮挡背景**
					border = "rounded", -- **使用圆角边框，更美观**
					zindex = 45, -- 堆叠顺序
					max_width = 80, -- **最大宽度，避免通知过长**
					max_height = 8, -- **最大高度，避免通知过高**
					x_padding = 1, -- **右侧边缘的水平间距，稍微多一点**
					y_padding = 0, -- **底部边缘的垂直间距**
					align = "bottom", -- **窗口对齐方式，显示在底部**
					relative = "editor", -- 窗口相对于编辑器
				},
			},

			-- 日志选项
			logger = {
				level = vim.log.levels.WARN, -- 最低日志级别
				max_size = 10000,
				float_precision = 0.01,
				path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
			},
		})
	end,
}
