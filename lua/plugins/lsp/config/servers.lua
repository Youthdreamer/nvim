--------------- 自维护LSP列表---------------
-- NOTE: 需要什么LSP，写入什么LSP的配置
-- NOTE: 这里的列表名称使用nvim-lspconfig的官方名称，不使用Mason的安装列表中的名称。
-- NOTE: 打开Mason后，lsp列表右侧的名称即是nvim-lspconfiog的名称。
local servers = {
	-- C/Cpp
	clangd = {},
	-- Rust
	["rust_analyzer"] = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
					onSave = true,
				},
				inlayHints = {
					enable = true,
					typeHints = { enable = true },
					parameterHints = { enable = true },
					chainingHints = { enable = true },
				},
			},
		},
	},
	-- Lua
	["lua_ls"] = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					-- path = vim.split(package.path, ";"),
				},
				diagnostics = {
					globals = { "vim" },
				},
				codeLens = {
					enable = true,
				},
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
				hint = {
					enable = true,
					setType = false,
					paramType = true,
					paramName = "Disable",
					semicolon = "Disable",
					arrayIndex = "Disable",
				},
			},
		},
	},
	-- Python
	basedpyright = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "standard", -- 或 standard/basic
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace", -- 控制诊断范围
				},
			},
		},
	},
	ruff = {},

	-- Web
	html = {},
	cssls = {},
	["emmet_ls"] = {},
	tailwindcss = {},
	-- JS/TS
	["ts_ls"] = {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = false,
					includeInlayPropertyDeclarationTypeHints = false,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = false,
				},
			},
		},
	},
	marksman = {},
	yamlls = {
		settings = {
			yaml = {
				schemaStore = {
					enable = true,
					url = "https://www.schemastore.org/api/json/catalog.json",
				},
				validate = true,
				completion = true,
				hover = true,
				format = {
					enable = false,
				},
				-- 防止大文件卡死
				maxItemsComputed = 5000,
			},
		},
	},
	-- typst
	tinymist = {},
	-- Nix
	-- ["nil_ls"] = {},
	-- Go
	-- gopls = {},
	-- Bash
	-- bashls = {},
	-- Zig
	-- zls = {},
	-- C#
	-- omnisharp = {},
	-- java
	-- jdtls={},
}

return servers
