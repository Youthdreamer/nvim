return {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	event = "InsertEnter", -- 进入插入模式时加载
	config = function()
		require("nvim-surround").setup({})
	end,
}
