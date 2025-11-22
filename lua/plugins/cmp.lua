-- ~/.config/nvim/lua/plugins/cmp.lua
-- 保留，但是暂不启用改插件
return {
	"hrsh7th/nvim-cmp",
	-- 插件加载事件，'InsertEnter' 是一个很好的平衡点，
	-- 确保在进入插入模式时加载，不会影响 Neovim 启动速度。
	event = "InsertEnter",
	enabled = false,
	-- 声明所有 nvim-cmp 依赖的补全源和代码片段引擎
	dependencies = {
		"hrsh7th/cmp-path", -- 路径补全源：提供文件系统路径的补全
		"hrsh7th/cmp-buffer", -- 缓冲区补全源：从当前及其他缓冲区中提取补全项
		"hrsh7th/cmp-nvim-lsp", -- LSP 补全源：与 LSP 服务器集成，提供代码补全
		"L3MON4D3/LuaSnip", -- 代码片段引擎：支持代码片段展开和补全
		"saadparwaiz1/cmp_luasnip", -- nvim-cmp 和 LuaSnip 的集成
		"hrsh7th/cmp-cmdline", -- 命令行模式补全（可选，但通常很有用）
		"hrsh7th/cmp-nvim-lua", -- Neovim Lua API 补全（可选）
	},

	-- 插件配置
	config = function()
		-- 获取 nvim-cmp 模块
		local cmp = require("cmp")
		-- 获取 luasnip 模块
		local luasnip = require("luasnip")

		cmp.setup({
			-- 1. 补全源配置：定义补全的来源和顺序
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP 语言服务器提供的补全
				{ name = "luasnip" }, -- 代码片段 (LuaSnip)
				{ name = "path" }, -- 文件路径补全（这是你最关心的）
				{ name = "buffer" }, -- 当前/其他缓冲区内容的补全
				-- { name = 'cmdline' },   -- 命令行模式下的补全（如果你启用了 cmp-cmdline）
				-- { name = 'nvim_lua' },  -- Neovim Lua API 补全
			}),

			-- 2. 补全 UI 界面和行为配置
			completion = {
				-- `completeopt` 选项：控制补全菜单的显示方式
				-- `menu`：显示补全菜单
				-- `menuone`：如果只有一个匹配项也显示菜单
				-- `noinsert`：在选择补全项前不自动插入
				completeopt = "menu,menuone,noinsert",
			},

			-- 3. 窗口样式：让补全菜单和文档窗口更美观
			window = {
				-- 补全菜单窗口
				completion = cmp.config.window.bordered({ -- 使用边框，更美观
					-- winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:PmenuSel",
					-- 如果你的主题有特殊的 float 窗口高亮，可以在这里设置
				}),
				-- 文档/预览窗口（显示补全项的详细信息，如 LSP 文档）
				documentation = cmp.config.window.bordered({ -- 同样使用边框
					-- winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:PmenuSel",
				}),
			},

			-- 4. 键盘映射：定义在插入模式下如何与补全菜单交互
			mapping = cmp.mapping.preset.insert({
				-- 滚动文档窗口
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Ctrl+b: 向上滚动文档
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- Ctrl+f: 向下滚动文档

				-- 触发补全（手动）
				["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space: 手动触发补全

				-- 取消补全
				["<C-e>"] = cmp.mapping.abort(), -- Ctrl+e: 取消补全

				-- 选择并确认补全项
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- 回车键：确认选中补全项并插入

				-- 切换到上一个/下一个补全项
				["<C-p>"] = cmp.mapping(function(fallback) -- Ctrl+p: 切换到上一个补全项
					if cmp.visible() then
						cmp.select({ behavior = cmp.SelectBehavior.Insert }) -- 在补全菜单中向上选择
					else
						fallback() -- 如果没有补全菜单，则执行默认的 Neovim 行为
					end
				end, { "i", "s" }), -- 插入模式和选择模式

				["<C-n>"] = cmp.mapping(function(fallback) -- Ctrl+n: 切换到下一个补全项
					if cmp.visible() then
						cmp.select({ behavior = cmp.SelectBehavior.Insert }) -- 在补全菜单中向下选择
					else
						fallback() -- 如果没有补全菜单，则执行默认的 Neovim 行为
					end
				end, { "i", "s" }), -- 插入模式和选择模式

				-- 代码片段跳转（如果你使用 luasnip）
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump() -- 展开或跳转到下一个片段占位符
					elseif cmp.visible() then
						cmp.select({ behavior = cmp.SelectBehavior.Select }) -- 在补全菜单中选择下一个
					else
						fallback() -- 如果没有片段或补全菜单，则执行默认 Tab 行为
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1) -- 跳转到上一个片段占位符
					elseif cmp.visible() then
						cmp.select({ behavior = cmp.SelectBehavior.Select }) -- 在补全菜单中选择上一个
					else
						fallback() -- 如果没有片段或补全菜单，则执行默认 Shift+Tab 行为
					end
				end, { "i", "s" }),
			}),

			-- 5. 片段引擎集成：指定 nvim-cmp 使用 LuaSnip 作为片段引擎
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- 用 luasnip 展开片段
				end,
			},

			-- 6. 自动补全触发设置
			-- `completion.auto_select = false` 可以让你在回车前手动选择补全项
			-- `trigger_characters` 可以设置只有输入这些字符时才触发补全
			-- (path 通常会在你输入 `/` 或 `.` 时自动触发)
		})

		-- ** 命令行模式的补全 (如果你安装了 cmp-cmdline)**
		cmp.setup.cmdline("/", {
			sources = cmp.config.sources({
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline(":", {
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})

		-- 如果你使用 LazyVim，通常已经有 LSP 和 Snippet 的基本配置了。
		-- 这个配置会确保路径补全源 (cmp-path) 和缓冲区补全源 (cmp-buffer) 被激活。
	end,
}
