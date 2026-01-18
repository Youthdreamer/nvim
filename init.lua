-- 自定义全局变量Cook
-- _G.Cook = {}

-- 核心基础配置
require("core.basic")
require("core.keymap")
require("core.lazy") -- 加载Lazy.nvim

-- 功能配置
require("features.switch-theme").setup() -- 安装主题后应该在features文件夹下的theme-list.lua主题列表维护

--检测是否是neovide启动，使用neovide配置
if vim.g.neovide then
	require("neovide.basic")
	require("neovide.keymap")
end

