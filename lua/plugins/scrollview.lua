-- 滚动条预览
return {
	"dstein64/nvim-scrollview",
	event = "BufReadPost",
	opts = {
		excluded_filetypes = { "neo-tree" }, -- 在这些文件类型中禁用滚动条
	},
	-- config = true, -- 会自动调用 setup() 函数并使用默认选项
}
