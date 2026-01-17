local map = vim.keymap.set
map("n", "<D-s>", ":w<CR>") -- Save
map("v", "<D-c>", '"+y') -- Copy
map("n", "<D-v>", '"+P') -- Paste normal mode
map("v", "<D-v>", '"+P') -- Paste visual mode
map("c", "<D-v>", "<C-R>+") -- Paste command mode
map("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

map("n", "<C-=>", function()
	vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) + 0.1
end, { silent = true, desc = "UI 放大" })

map("n", "<C-->", function()
	vim.g.neovide_scale_factor = math.max(0.5, (vim.g.neovide_scale_factor or 1.0) - 0.1)
end, { silent = true, desc = "UI 缩小" })
