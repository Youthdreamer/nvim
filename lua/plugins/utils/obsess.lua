return {
  "Youthdreamer/obsess",
  cmd = { "ObsessTimer", "ObsessTimerSec", "ObsessTaskAdd", "ObsessTaskLoad" },
  opts = {
    position = "center",
    window = {
      width = 60,
      height = 15,
      border = "rounded",
      style = "minimal",
      title = "Obsess",
    },
    -- 倒计时结束后的弹窗提醒设置
    flash = {
      times = 6,            -- 闪烁次数
      innilterval_ms = 300, -- 每次间隔时间
    },
  },

  keys = {
    { "<leader>ot", "<cmd>ObsessTimer<cr>", desc = "定时器（分钟）" },
    { "<leader>os", "<cmd>ObsessTimerSec<cr>", desc = "定时器（秒）" },
    { "<leader>ow", "<cmd>ObsessToggle<cr>", desc = "显示/隐藏窗口" },
    { "<leader>oc", "<cmd>ObsessClose<cr>", desc = "关闭窗口并停止计时" },
    { "<leader>oa", "<cmd>ObsessTaskAdd<cr>", desc = "添加任务" },
    { "<leader>ox", "<cmd>ObsessTaskDone<cr>", desc = "切换任务状态" },
    { "<leader>od", "<cmd>ObsessTaskDel<cr>", desc = "删除任务" },
    { "<leader>oe", "<cmd>ObsessTaskClear<cr>", desc = "清空任务" },
    { "<leader>ol", "<cmd>ObsessTaskLoad<cr>", desc = "刷新任务面板" },
  },
}
