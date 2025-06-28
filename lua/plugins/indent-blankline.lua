return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPost",
	opts = {
		indent = { char = "│" },
		whitespace = {
			remove_blankline_trail = false,
		},
		scope = { enabled = false },
	},
}
