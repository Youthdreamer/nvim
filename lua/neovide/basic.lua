vim.opt.clipboard = "unnamedplus"
-- neovide的基础配置文件Basic.lua
vim.opt.linespace = 2 -- 行距2
-- 光标动画
vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- 缩放
vim.g.neovide_scale_factor = 1.0
-- 支持框线绘制方式（修复字符边框断裂问题）
vim.g.neovide_box_drawing_mode = "native"
vim.g.neovide_box_drawing_sizes = { default = { 2, 4 } }
-- 标题栏设置 win10上暂不支持
vim.g.neovide_title_background_color =
	string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
vim.g.neovide_title_text_color = "#ffffff"
