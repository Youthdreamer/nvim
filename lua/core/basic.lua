--行号
vim.opt.number = true -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号

--换行统一
-- 设置文件默认保存格式为 Unix (LF)
vim.opt.fileformat = "unix"
-- 设置文件格式检测优先级，Unix 优先
vim.opt.fileformats = { "unix", "dos", "mac" }

-- 搜索
vim.opt.ignorecase = true -- 搜索忽略大小写
vim.opt.smartcase = true -- 如果包含大写字符，则区分大小写

--换行缩进
vim.opt.tabstop = 4 -- Tab 长度为 4
vim.opt.shiftwidth = 4 -- 缩进长度为 4
vim.opt.expandtab = true -- 将 Tab 替换为空格
vim.opt.autoindent = true -- 复制当前行的缩进
vim.opt.smartindent = true -- 在代码块中自动增加缩进
vim.opt.wrap = false -- 不换行显示
vim.opt.colorcolumn = { "80", "120" }
vim.opt.cursorline = true -- 启动光标行高亮

vim.o.termguicolors = true -- 真色彩Alacritty，kitty，iTerm2 (macOS)，Windows Terminal (Windows 10/11)等
vim.opt.laststatus = 2 -- 禁用底部状态栏

-- python中为4个空格的缩进
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "",
-- 	callback = function()
-- 		vim.opt_local.shiftwidth = 4
-- 		vim.opt_local.tabstop = 8 -- 即使是空格，也建议保持 tabstop 为 8
-- 		vim.opt_local.expandtab = true
-- 	end,
-- })

-- 光标位置
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- 功能
vim.opt.undofile = true -- 启用持久撤销
vim.opt.clipboard = "unnamedplus" -- 共享系统剪切板

-- 代码折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- 打开文件时不自动折叠
vim.opt.foldlevelstart = 99 -- 默认展开所有

--取消自动换行注释
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r" })
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

-- nvim是透明背景时需要这个设置
-- vim.cmd([[
--     highlight NotifyBackground guibg=#000000
-- ]])
