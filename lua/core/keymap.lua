local map = vim.keymap.set
vim.g.mapleader = " "

map("n", "<leader>T", "<cmd>ThemeSwitch<cr>", { silent = true, desc = "主题切换" })

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map({ "i", "n" }, "<C-z>", "<Cmd>undo<CR>", { silent = true, desc = "撤销操作" })
map({ "i", "n" }, "<C-S-z>", "<Cmd>redo<CR>", { silent = true, desc = "反撤销操作" })
map({ "i", "n", "v" }, "<C-S-q>", "<Cmd>q!<CR>", { silent = true, desc = "不保存退出" })
map({ "i", "n", "v", "s" }, "<C-s>", "<Cmd>w<CR>", { silent = true, desc = "保存文件" })
map({ "i", "n" }, "<C-a>", "<Cmd>normal! ggVG<CR>", { silent = true, desc = "全选操作" })

map("v", "<C-c>", '"+y', { desc = "复制到系统剪贴板" })

map("i", "<C-x>", "<C-o>dd", { noremap = true, silent = true, desc = "剪切" })
map("n", "<C-x>", '"+dd', { noremap = true, silent = true, desc = "剪切" })
map("v", "<C-x>", '"+x', { noremap = true, silent = true, desc = "剪切" })

map("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "退出编辑器" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "增加窗户高度" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "减少窗户高度" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "增加窗户宽度" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "减少窗户宽度" })

map("n", "<leader>wH", "<C-w>H", { silent = true, desc = "窗口移到左边" })
map("n", "<leader>wJ", "<C-w>J", { silent = true, desc = "窗口移到底部" })
map("n", "<leader>wK", "<C-w>K", { silent = true, desc = "窗口移到底部" })
map("n", "<leader>wL", "<C-w>L", { silent = true, desc = "窗口移到右边" })

map("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { silent = true, desc = "新建标签页" })
map("n", "<leader><tab>d", "<cmd>tabclose<CR>", { silent = true, desc = "关闭当前标签页" })
map("n", "<leader><tab>o", "<cmd>tabonly<CR>", { silent = true, desc = "关闭其他标签页" })
map("n", "<leader><tab>l", "<cmd>tabnext<CR>", { silent = true, desc = "切换到下一个标签页" })
map("n", "<leader><tab>h", "<cmd>tabprevious<CR>", { silent = true, desc = "切换到上一个标签页" })
