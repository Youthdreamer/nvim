--------------- 自维护LSP列表---------------
-- NOTE: 需要什么LSP，写入什么LSP的配置
-- NOTE: 这里的列表名称使用nvim-lspconfig的官方名称，不使用Mason的安装列表中的名称。
-- NOTE: 打开Mason后，lsp列表右侧的名称即是nvim-lspconfiog的名称。
local servers = {
	["lua_ls"] = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				codeLens = {
					enable = true,
				},
				workspace = {
					checkThirdParty = false,
					ignoreDir = {
						".git",
					},
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
	["pyright"] = {
		settings = {
			pyright = {
				disableOrganizeImports = true, -- 禁用 Pyright 自动整理 import
			},
			python = {
				analysis = {
					ignore = { "*" }, -- 忽略所有文件分析，让 Ruff 处理 lint
				},
			},
		},
	},
	-- ["ruff"] = {},
	["html"] = {},
	["cssls"] = {},
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
			-- 保持 javascript 默认不启用
		},
	},
	["emmet_ls"] = {},
	["tailwindcss"] = {},
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
	-- ["gopls"] = {},
}

return servers
