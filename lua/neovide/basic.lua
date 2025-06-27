-- neovide的基础配置文件Basic.lua

vim.opt.guifont = "FiraCode Nerd Font Mono,LXGW WenKai Mono:h16" -- 设置GUI界面的字体与大小
vim.opt.linespace = 2 -- 行距2

-- 光标动画
vim.g.neovide_cursor_vfx_mode = { "pixiedust", "ripple" }
-- vim.g.neovide_cursor_vfx_mode = "ripple"

vim.g.neovide_scale_factor = 1.0 -- 缩放
-- vim.g.neovide_fullscreen = true -- 全屏

-- 支持框线绘制方式（修复字符边框断裂问题）
vim.g.neovide_box_drawing_mode = "native"
vim.g.neovide_box_drawing_sizes = { default = { 2, 4 } }

-- 标题栏设置 win10上暂不支持
vim.g.neovide_title_background_color =
	string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
vim.g.neovide_title_text_color = "#ffffff"
