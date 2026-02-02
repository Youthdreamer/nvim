-- 折叠插件ufo.lua
return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"nvim-treesitter/nvim-treesitter", -- 确保 treesitter 已安装
		},
		event = "User LazyFile",
		config = function()
			-- 类似 VSCode 的折叠设置
			-- vim.opt.foldcolumn = "1" -- 折叠列宽度（0 表示只在折叠处显示）
			vim.opt.foldlevel = 99 -- 默认展开所有代码
			vim.opt.foldlevelstart = 99 -- 打开文件时默认展开
			vim.opt.foldenable = true -- 启用折叠
			vim.opt.foldmethod = "expr" -- 使用 UFO 的表达式折叠
			vim.opt.foldexpr = "v:lua.vim.ufo.foldexpr()" -- 使用 UFO 的表达式
			-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- 使用 Treesitter 的折叠表达式
			-- VSCode 风格的折叠图标
			vim.opt.fillchars = {
				foldopen = "", -- 折叠打开图标
				foldclose = "", -- 折叠关闭图标
				fold = " ", -- 折叠填充字符
				foldsep = " ", -- 折叠分隔符
				diff = "╱", -- diff 填充字符
				eob = " ", -- 行尾空白字符
			}

			-- 类似 VSCode 的折叠键位
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

			-- 类似 VSCode 的折叠预览（悬停时显示）
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end)

			-- 配置 UFO 实现 VSCode 风格
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" } -- 优先 treesitter
				end,

				-- VSCode 风格的折叠文本
				fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local suffix = (" 󰁂 %d "):format(endLnum - lnum) -- 折叠行数
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0

					-- 保留原始缩进
					for _, chunk in ipairs(virtText) do
						local chunkText = chunk[1]
						local chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if targetWidth > curWidth + chunkWidth then
							table.insert(newVirtText, chunk)
						else
							chunkText = truncate(chunkText, targetWidth - curWidth)
							local hlGroup = chunk[2]
							table.insert(newVirtText, { chunkText, hlGroup })
							chunkWidth = vim.fn.strdisplaywidth(chunkText)
							if curWidth + chunkWidth < targetWidth then
								suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
							end
							break
						end
						curWidth = curWidth + chunkWidth
					end

					-- 添加折叠信息到行尾（类似 VSCode）
					table.insert(newVirtText, { suffix, "Comment" })
					return newVirtText
				end,
			})

			-- 确保 LSP 支持折叠
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
		end,
	},
}
