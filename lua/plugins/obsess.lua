return {
	"Youthdreamer/obsess",
	cmd = { "ObsessTimer", "ObsessTimerSec", "ObsessTaskAdd" },
	opts = {
		window = {
			relative = "editor",
			anchor = "NE",
			col = vim.o.columns,
			row = 0,
			width = 30,
			height = 5,
			border = "rounded",
			style = "minimal",
		},
		-- 倒计时结束后的弹窗提醒设置
		flash = {
			times = 6, -- 闪烁次数
			innilterval_ms = 300, -- 每次间隔时间
		},
	},

	keys = {
		{ "<leader>os", "<cmd>ObsessToggle<cr>", desc = "切换窗口" },
		{ "<leader>oc", "<cmd>ObsessClose<cr>", desc = "注销" },
		{ "<leader>oo", "<cmd>ObsessTimer<cr>", desc = "设置定时器" },
		{ "<leader>ol", "<cmd>ObsessTimerSec<cr>", desc = "设置定时器" },
		{ "<leader>oa", "<cmd>ObsessTaskAdd<cr>", desc = "添加任务" },
		{ "<leader>ot", "<cmd>ObsessTaskDone<cr>", desc = "切换任务状态" },
		{ "<leader>od", "<cmd>ObsessTaskDel<cr>", desc = "删除任务" },
		{ "<leader>oe", "<cmd>ObsessTaskClear<cr>", desc = "清空任务列表" },
	},
}
