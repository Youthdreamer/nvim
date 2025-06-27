local M = {}

-- 导入自定义主题配置表
local custom_theme_list = require("features.theme-list").colorschemes

local theme_name_list = vim.tbl_keys(custom_theme_list) -- 主题名称表
local config_path = vim.fn.stdpath("config") -- 这个是nvim的配置文件的位置
local theme_path = config_path .. "/theme" -- 主题持久化文件位置

-- 加载theme
local function load_theme()
	local file = io.open(theme_path, "r")
	if file then
		-- 读取文件
		local theme = file:read("*a")
		file:close()
		if theme and theme ~= "" then
			vim.cmd("colorscheme " .. theme)
		else
			vim.cmd("colorscheme default")
		end
	end
end

-- 选择器功能: 主题切换
local switch_theme = function(opts)
	-- 自定义Telescope主题切换窗口
	local pickers = require("telescope.pickers") -- 用于创建新选择器的主模块。
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local finders = require("telescope.finders") -- 提供接口来用项目填充选择器。
	local conf = require("telescope.config").values -- 保存用户配置的 values

	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "colorscheme",
			finder = finders.new_table({
				results = theme_name_list,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				-- 绑定回车键选中
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					if not selection then
						vim.notify("未选中主题" .. selection, vim.log.levels.ERROR)
						return
					end
					vim.cmd("colorscheme " .. selection.value)
					actions.close(prompt_bufnr)
				end)
				return true
			end,
		})
		:find()
end

-- 持久化保存主题，以便下次打开时加载
local function save_theme(current_theme)
	local file = io.open(theme_path, "w")
	if file then
		file:write(current_theme) -- 将主题，存入文件
		file:close()
	end
end

-- 自动检测主题切换并保存持久化
local function detect_theme_change()
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			local current_theme = vim.g.colors_name or "default"
			save_theme(current_theme)
		end,
	})
end

function M.setup(opts)
	opts = opts or {}

	detect_theme_change()
	load_theme() -- 延迟绑定主题切换快捷键
	-- 注册用户命令，将主题切换功能延迟到此命令被执行时才加载和运行
	vim.api.nvim_create_user_command("ThemeSwitch", function(args)
		-- 当用户执行 :ThemeSwitch 时，才调用延迟加载函数
		switch_theme(args)
	end, { nargs = "?", desc = "使用Telescope切换主题" })
end
return M
