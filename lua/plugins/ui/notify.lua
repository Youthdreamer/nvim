return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
		timeout = 3000, -- **消息显示时间（毫秒），例如 3000ms = 3秒**
		stages = "static", -- **重要：设置为 'static' 可以确保 timeout 精确生效**
		-- 'fade', 'slide' 等动画效果可能会导致实际显示时间略长于 timeout
		-- 其他 nvim-notify 选项，例如：
		-- top_notification = true, -- 在顶部显示通知
		-- max_height = function() return math.floor(vim.o.lines * 0.75) end,
		-- max_width = function() return math.floor(vim.o.columns * 0.75) end,
		-- render = "compact", -- 更紧凑的渲染方式
	},
}
