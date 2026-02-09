-- 因为透明插件无法再neovide中使用所以单独设置插件命令
if vim.g.neovide then
	-- 为 Neovide 的透明设置 Cmd 命令，并禁用透明插件的Cmd命令
	local state_file = vim.fn.stdpath("data") .. "/neovide_transparency" -- 透明度参数存储位置
	local f = io.open(state_file, "r")
	if f then
		vim.g.neovide_opacity = tonumber(f:read("*l")) or 1
		f:close()
	end
	vim.api.nvim_create_user_command("TransparentToggle", function()
		local next = (vim.g.neovide_opacity == 1.0) and 0.88 or 1.0
		vim.g.neovide_opacity = next

		local w = io.open(state_file, "w")
		if w then
			w:write(tostring(next))
			w:close()
		end
	end, {})
	return {}
else
	return {
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NormalFloat",
					"NvimTreeNormal",
					"TelescopeNormal",
				},
			})
			-- Bufferline
			-- require("transparent").clear_prefix("BufferLine")
			-- require("transparent").clear_prefix("TabLine")
			-- require("transparent").clear_prefix("WildMenu") -- possibly not necessary

			-- Lualine
			-- require("transparent").clear_prefix("lualine")

			-- Neo-tree
			require("transparent").clear_prefix("NeoTree")
		end,
	}
end
