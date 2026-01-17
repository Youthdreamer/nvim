return {
	"folke/persistence.nvim",
	event = "BufReadPost",
	opts = {
		dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
		need = 1,
		branch = true, -- use git branch to save session
	},
}
