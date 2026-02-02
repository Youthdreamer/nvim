return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	opts = {
		indent = { char = "│" },
		whitespace = {
			remove_blankline_trail = false,
		},
		scope = { enabled = false },
	},
}
