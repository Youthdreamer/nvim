-- 展示启动耗时 startup_time.lua

-- 记录启动开始时间
local start_time = vim.loop.hrtime()

-- 创建 VimEnter 自动命令
vim.api.nvim_create_autocmd("VimEnter", {
  once = true, -- 确保只触发一次
  callback = function()
    -- 计算启动耗时
    local elapsed_ms = (vim.loop.hrtime() - start_time) / 1e6
    -- 输出启动耗时到消息行
    vim.cmd(string.format('echomsg "Neovim 启动完成耗时: %.2f ms"', elapsed_ms))
    -- 将耗时存储到全局变量，供后续 noice 弹窗使用
    vim.g.neovim_startup_time = elapsed_ms
  end,
})

-- 延迟触发通知，确保 noice.nvim 已加载
vim.defer_fn(function()
  if vim.g.neovim_startup_time then
    -- 使用 noice 的通知功能
    vim.notify(
      string.format("Neovim 启动完成耗时: %.2f ms", vim.g.neovim_startup_time),
      vim.log.levels.INFO,
      { title = "启动信息", timeout = 3000 }
    )
    -- 清理全局变量，防止后续误用
    vim.g.neovim_startup_time = nil
  end
end, 100) -- 延迟 100 毫秒以等待插件加载

