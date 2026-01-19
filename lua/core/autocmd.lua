-- 自定义加载事件，最适合bufferline与lualine
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	desc = "自定义事件LazyFile",
	pattern = "*",
	once = true,
	callback = function()
		if not vim.g._lazyfile_triggered then
			vim.g._lazyfile_triggered = true
			-- 异步调度，保证其他 BufReadPost 回调先执行
			vim.schedule(function()
				vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
			end)
		end
	end,
})

-- 复制高亮提示
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "复制高亮提示",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})

-- 取消自动换行注释
vim.api.nvim_create_autocmd("FileType", {
	desc = "取消自动换行注释",
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r" })
	end,
})

-- 部分文档文件开启自动软换行
vim.api.nvim_create_autocmd("FileType", {
	desc = "部分文档文件开启自动软换行",
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

-- 自动保存当前缓冲区或切换缓冲区时保存
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	pattern = "*",
	callback = function()
		-- 检查缓冲区类型是否为普通文件
		if vim.bo.buftype == "" and vim.bo.modified and vim.fn.expand("%") ~= "" then
			local success, err = pcall(function()
				vim.cmd("write")
			end)

			if not success then
				vim.notify("保存文件时出错: " .. err, vim.log.levels.ERROR)
			end
		end
	end,
})
