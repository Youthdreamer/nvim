-- 模糊文件查找
return {
	"nvim-telescope/telescope.nvim",
	-- tag = "*",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		-- 需要就开启但是需要gcc与make
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"DrKJeff16/project.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<A-s>"] = require("telescope.actions").file_split,
						["<A-t>"] = require("telescope.actions").file_tab,
						["<A-v>"] = require("telescope.actions").file_vsplit,
					},
					n = {
						["<A-s>"] = require("telescope.actions").file_split,
						["<A-t>"] = require("telescope.actions").file_tab,
						["<A-v>"] = require("telescope.actions").file_vsplit,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("projects")
		telescope.load_extension("file_browser")
		telescope.load_extension("live_grep_args")
	end,
	keys = {
		{ "<leader>fp", "<cmd>Telescope projects layout_config={height=0.6,width=0.6}<cr>", desc = "切换项目" }, -- project.nvim 的Telescope扩展
		{
			"<leader>ff",
			"<cmd>Telescope find_files theme=dropdown previewer=false layout_config={height=0.3}<cr>",
			desc = "查找文件",
		},
		{ "<leader>fs", "<cmd>Telescope grep_string theme=ivy layout_config={height=0.4}<cr>", desc = "字符快搜" },
		{ "<leader>fg", "<cmd>Telescope live_grep theme=ivy layout_config={height=0.4}<cr>", desc = "全局搜索" },
		{
			"<leader>fb",
			"<cmd>Telescope buffers layout_config={mirror=true,prompt_position=top,height=0.4,width=0.6} layout_strategy=vertical previewer=false<cr>",
			desc = "查看缓冲区",
		},
		{
			"<leader>fo",
			"<cmd>Telescope oldfiles theme=dropdown previewer=false layout_config={height=0.3}<cr>",
			desc = "历史文件",
		},
		{
			"<leader>fr",
			"<cmd>Telescope live_grep_args theme=ivy layout_config={height=0.4}<cr>",
			desc = "高级搜索",
		},
		{
			"<leader>fk",
			"<cmd>Telescope keymaps layout_config={width=0.8}<cr>",
			desc = "帮助查询",
		},
		{
			"<leader>H",
			"<cmd>Telescope help_tags theme=ivy layout_config={height=0.4}<cr>",
			desc = "帮助查询",
		},

		-- 推荐的 LSP 查找
		{ "<leader>cr", "<cmd>Telescope lsp_references<cr>", desc = "查找引用" },
		{ "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", desc = "查找实现" },
		{ "<leader>cw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "查找工作区符号" },
		{ "<leader>cf", "<cmd>Telescope lsp_document_symbols<cr>", desc = "文件大纲" },

		-- LSP 调用图
		{ "<leader>c[", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "被调列表" },
		{ "<leader>c]", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "调用列表" },

		-- 推荐的 LSP 诊断和代码动作
		{ "<leader>ce", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "当前文件诊断" },
		{ "<leader>cW", "<cmd>Telescope diagnostics<cr>", desc = "全局诊断" },
	},
}
