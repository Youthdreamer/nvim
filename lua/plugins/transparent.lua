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
