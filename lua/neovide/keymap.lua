local map = vim.keymap.set
-- Lua
vim.o.clipboard = "unnamedplus"
map({ "i", "n", "v" }, "<C-s>", "<Cmd>w<CR>", { silent = true, desc = "保存文件" })

map("n", "<C-=>", function()
	vim.o.guifont = string.gsub(vim.o.guifont, ":h%d+", ":h" .. (tonumber(vim.o.guifont:match(":h(%d+)")) + 1))
end, { silent = true, desc = "增大字体" })
map("n", "<C-->", function()
	vim.o.guifont = string.gsub(vim.o.guifont, ":h%d+", ":h" .. (tonumber(vim.o.guifont:match(":h(%d+)")) - 1))
end, { silent = true, desc = "减小字体" })

map("n", "<C-v>", '"+p', { noremap = true, silent = true, desc = "粘贴" })
-- 命令行模式下粘贴
map("c", "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "粘贴" })
-- 插入模式下粘贴
map("i", "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "粘贴" })
-- 如果你想使用 Ctrl-Shift-V 进行粘贴 (类似终端行为)
-- vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste system clipboard" })
