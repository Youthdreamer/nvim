-- 模糊文件查找
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"ahmedkhalf/project.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local lga_actions = require("telescope-live-grep-args.actions")
		telescope.setup({
			defaults = {},
			pickers = {
				find_files = {
					-- theme = "cursor",
				},
				live_grep = {
					-- theme = "dropdown",
				},
				lsp_workspace_symbols = {
					-- theme = "ivy",
				},
				lsp_document_symbols = {
					-- theme = "ivy",
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- 自动添加引号
					mappings = { -- 添加快捷键映射
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							-- 快速添加常用参数的快捷键
							["<C-t>"] = lga_actions.quote_prompt({ postfix = " --type=" }),
							["<C-g>"] = lga_actions.quote_prompt({ postfix = " --glob=" }),
						},
					},
				},
				recent_projects = {
					theme = "ivy",
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("projects")
	end,
	keys = {
		{ "<leader>fp", "<cmd>Telescope projects<cr>", desc = "切换项目" }, -- project.nvim 的Telescope扩展
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
		{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "字符快搜" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "全局搜索" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "查看缓冲区" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "历史文件" },
		{ "<leader>fr", "<cmd>Telescope live_grep_args<cr>", desc = "高级搜索" },

		-- 切换主题
		-- { "<leader>T", "<cmd>Telescope colorscheme<cr>", desc = "切换主题" },

		-- 推荐的 LSP 查找
		{ "<leader>cd", "<cmd>Telescope lsp_definitions<cr>", desc = "跳转到定义" },
		{ "<leader>ct", "<cmd>Telescope lsp_type_definitions<cr>", desc = "跳转到类型" },
		{ "<leader>cr", "<cmd>Telescope lsp_references<cr>", desc = "查找引用" },
		{ "<leader>cD", "<cmd>Telescope lsp_declarations<cr>", desc = "跳转到声明" },
		{ "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", desc = "查找实现" },
		{ "<leader>cw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "查找工作区符号" },
		{ "<leader>cs", "<cmd>Telescope treesitter<cr>", desc = "代码符号查找(treesitter)" },
		-- 文件内符号导航
		{ "<leader>cf", "<cmd>Telescope lsp_document_symbols<cr>", desc = "文件大纲" },

		-- LSP 调用图
		{ "<leader>c[", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "被调列表" },
		{ "<leader>c]", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "调用列表" },

		-- 推荐的 LSP 诊断和代码动作
		{ "<leader>ce", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "当前文件诊断" },
		{ "<leader>cW", "<cmd>Telescope diagnostics<cr>", desc = "全局诊断" },

		-- 推荐的 Git 查找
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "查找Git提交" },
		{ "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "查找文件提交" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "查找Git分支" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "查看Git状态" },
	},
}
