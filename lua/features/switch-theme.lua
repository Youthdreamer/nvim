local M = {}

-- 导入自定义主题配置表
local custom_theme_list = require("features.theme-list").colorschemes

local theme_name_list = vim.tbl_keys(custom_theme_list) -- 主题名称表
local config_path = vim.fn.stdpath("data") -- 这个是nvim的配置文件的位置
local theme_path = config_path .. "/theme" -- 主题持久化文件位置
-- local theme_path = "./theme"

-- 加载theme
local function load_theme()
	local file = io.open(theme_path, "r")
	if file then
		local data = file:read("*a")
		file:close()

		-- 解析保存的数据
		if data and data ~= "" then
			local theme_name, style = string.match(data, "([^:]+):?([^:]*)")

			if theme_name and theme_name ~= "" then
				-- 1. 应用 style
				if style and style ~= "" then
					vim.o.background = style -- 设置 vim 的 'background' 选项
				end

				-- 2. 加载主题
				vim.cmd("colorscheme " .. theme_name)
			end
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
	local themes = require("telescope.themes")

	opts = opts or {}

	-- 解析 :ThemeSwitch theme=ivy width=0.2 height=0.5 这种参数
	local ui_theme = "dropdown"
	local layout_config = {}

	if opts.args and opts.args ~= "" then
		for key, value in string.gmatch(opts.args, "(%w+)%s*=%s*([%w%.]+)") do
			if key == "theme" then
				ui_theme = value
			elseif key == "width" or key == "height" then
				layout_config[key] = tonumber(value)
			elseif key == "preview" then
				layout_config.preview_height = tonumber(value)
			end
		end
	end

	-- 根据参数选择 UI 样式
	local theme_opts
	if ui_theme == "ivy" then
		theme_opts = themes.get_ivy({
			layout_config = vim.tbl_extend("force", {
				height = 0.35,
			}, layout_config),
		})
	elseif ui_theme == "cursor" then
		theme_opts = themes.get_cursor({
			layout_config = vim.tbl_extend("force", {
				width = 0.4,
				height = 0.3,
			}, layout_config),
		})
	else
		theme_opts = themes.get_dropdown({
			layout_config = vim.tbl_extend("force", {
				width = 0.5,
				height = 0.4,
			}, layout_config),
		})
	end

	pickers
		.new(theme_opts, {
			prompt_title = "colorscheme",
			finder = finders.new_table({
				results = theme_name_list,
			}),
			sorter = conf.generic_sorter(theme_opts),
			attach_mappings = function(prompt_bufnr, _)
				-- 绑定回车键选中
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					if not selection then
						vim.notify("未选中主题" .. selection, vim.log.levels.ERROR)
						return
					end

					local theme_name = selection.value
					local theme_info = custom_theme_list[theme_name] or {}

					--  尝试设置全局 style 变量（许多主题插件会读取它）
					if theme_info.style then
						vim.o.background = theme_info.style -- 设置 vim 的 'background' 选项
						vim.g.theme_style = theme_info.style -- 设置一个自定义全局变量供插件使用
					end

					vim.cmd("colorscheme " .. theme_name)
					actions.close(prompt_bufnr)
				end)
				return true
			end,
		})
		:find()
end

-- 持久化保存主题，以便下次打开时加载
local function save_theme(current_theme)
	-- 获取当前 theme 的 style 信息（light 或 dark）
	local current_style = vim.o.background or "dark"
	local data_to_save = current_theme .. ":" .. current_style

	local file = io.open(theme_path, "w")
	if file then
		file:write(data_to_save) -- 将主题，存入文件
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
