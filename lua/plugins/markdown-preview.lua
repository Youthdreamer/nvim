return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	keys = {
		{ "<leader>pm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown内容预览" },
	},
}
