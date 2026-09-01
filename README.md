# Cookvim

一款基于 [Lazy.nvim](https://github.com/folke/lazy.nvim) 的现代化 Neovim 配置，注重开箱即用的开发体验：

- 插件按需懒加载，启动迅速
- 内置 **15 个主题系列、近 50 种配色**，Telescope 可视化切换并自动持久化
- 完善的 **LSP / 格式化 / 补全** 方案（Mason 统一管理，开箱即装）
- Git 工作流（Gitsigns + Lazygit）与 Harpoon 快速标记跳转
- 深度适配 **Neovide**（GUI 客户端）

> 快捷键默认使用 `<leader>` 为 **空格键**，编辑器内以 which-key 方式展示。

---

## ✨ 功能特性

| 类别 | 说明 |
| ---- | ---- |
| 🎨 主题系统 | 15 个主题系列（tokyonight / catppuccin / kanagawa / nightfox / rose-pine / monokai-pro 等），`:ThemeSwitch` 命令 + Telescope 选择器切换，选择结果持久化，下次启动自动恢复 |
| 🧠 LSP 支持 | Mason 自动安装 13 个预置 LSP 服务器；内联提示 (inlay hints)；诊断图标与浮窗；代码跳转/重命名/引用/调用图 |
| ✍️ 格式化 | 保存时自动格式化（conform.nvim），支持 C/C++、Rust、Lua、Python、JS/TS、Web、Markdown、YAML、TOML、Typst 等，LSP 格式化被禁用以避免冲突 |
| 💡 补全 | blink.cmp（super-tab 键位），支持 LSP / 缓冲区 / 路径 / 代码片段（friendly-snippets） |
| 🔍 查找 | Telescope + fzf-native 模糊搜索：文件、缓冲区、全局搜索、历史文件、项目切换、快捷键/帮助查询 |
| 🌲 文件管理 | Neo-tree 文件树 + mini.files 快速文件浏览（按 `-` 打开） |
| 📝 语法高亮 | Treesitter 自动安装解析器，彩虹括号，缩进线/缩进范围高亮 |
| 🐙 Git | Gitsigns（行内 blame、hunk 导航/预览/diff）+ Lazygit 可视化操作 |
| 🚀 效率工具 | Flash 精准跳转、nvim-surround 环绕编辑、UFO 代码折叠（VSCode 风格）、持久化会话、自动保存、TODO 管理、Trouble 问题面板 |
| 🖥️ 终端 | ToggleTerm 浮动/分屏终端 |
| ⏱️ 专注面板 | Obsess（自研）：番茄钟定时器 + 任务清单 |
| 📄 文档预览 | Markdown 浏览器实时预览 + Typst 预览 |
| 🖼️ GUI 适配 | 检测到 Neovide 时自动加载专用配置（光标特效、UI 缩放、原生快捷键、独立透明方案） |

---

## 📦 环境依赖

**必装**

| 依赖 | 用途 |
| ---- | ---- |
| Neovim ≥ 0.11（推荐 0.12+） | 使用 `vim.lsp.config`、`winborder` 等新 API |
| git | 克隆插件 |
| 一款 Nerd Font 字体 | 显示图标（文件图标、状态栏等） |
| ripgrep | Telescope 全局搜索（`live_grep`） |
| fd | 文件查找加速（可选，有 ripgrep 亦可） |

**按需安装（对应功能才需要）**

| 依赖 | 用途 |
| ---- | ---- |
| make + gcc | 编译 telescope-fzf-native |
| node + npm | Markdown 预览插件构建、JS/TS 格式化工具 |
| python | Python LSP / 格式化工具 |
| lazygit | `<leader>gg` 打开 Git 可视化界面 |
| 7zip / unzip | 部分 LSP 服务器（如 yamlls）的下载解压 |

---

## 🚀 安装

### 1. 备份原有配置

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
```

### 2. 克隆配置

```bash
git clone https://github.com/Youthdreamer/nvim ~/.config/nvim
```

### 3. 启动安装

```bash
nvim
```

首次启动会自动克隆 Lazy.nvim 并安装全部插件，然后执行 `:Lazy` 查看安装进度。

### 4. 安装 LSP 与格式化工具

Mason 会在首次启动时根据 `lua/plugins/lsp/config/servers.lua` 与 `formatters.lua` 中的清单自动安装 LSP 服务器与格式化工具（后台进行）。也可手动执行：

```vim
:Mason            " 打开 Mason 管理面板
:MasonInstall <name>
```

> 提示：rust-analyzer、clangd 等体积较大的服务器可能需要较长下载时间；rustfmt 随 Rust 工具链附带，无需额外安装。

---

## 📁 目录结构

```
~/.config/nvim
├── init.lua                        # 入口：加载核心配置、功能配置、Neovide 配置
├── lazy-lock.json                  # 插件版本锁定
└── lua
    ├── core                        # 核心配置
    │   ├── autocmd.lua             # 自定义事件 LazyFile、复制高亮、自动保存等
    │   ├── basic.lua               # 基础选项（行号、缩进、搜索、剪切板等）
    │   ├── keymap.lua              # 全局快捷键
    │   └── lazy.lua                # Lazy.nvim 加载器
    ├── features                    # 独立功能模块
    │   ├── switch-theme.lua        # 主题切换与持久化（:ThemeSwitch 命令）
    │   └── theme-list.lua          # 主题列表维护
    ├── neovide                     # Neovide GUI 专用配置（检测到 Neovide 时加载）
    │   ├── basic.lua
    │   └── keymap.lua
    └── plugins                     # 插件配置（按分类组织，lazy.nvim 自动导入）
        ├── editor/                 # 编辑体验（treesitter、neo-tree、autopairs 等）
        ├── git/                    # Git（gitsigns、lazygit）
        ├── lsp/                    # LSP 体系
        │   └── config/
        │       ├── servers.lua     # ★ LSP 服务器清单（自维护）
        │       └── formatters.lua  # ★ 格式化工具清单（自维护）
        ├── navigation/             # 查找与跳转（telescope、harpoon、which-key）
        ├── ui/                     # 界面（alpha、bufferline、lualine、noice 等）
        └── utils/                  # 实用工具（flash、trouble、toggleterm、ufo 等）
```

---

## 🔧 自定义配置

### 主题管理

新增主题分两步：

1. **安装插件**：在 `lua/plugins/theme.lua` 中追加插件定义；
2. **登记配色**：在 `lua/features/theme-list.lua` 的 `colorschemes` 表中添加配色名称（可选 `style` 字段指定明暗）。

切换主题：`<leader>T` 或执行 `:ThemeSwitch`，支持参数调整选择器外观：

```vim
:ThemeSwitch theme=ivy width=0.4 height=0.5
:ThemeSwitch theme=cursor
:ThemeSwitch theme=dropdown preview=0.3
```

> 选择结果会保存至 `stdpath("data")/theme`，下次启动自动恢复。

### 添加 LSP 服务器

编辑 `lua/plugins/lsp/config/servers.lua`，按需增删（名称使用 nvim-lspconfig 的官方名称）：

```lua
-- 启用示例
gopls = {},
-- 或带自定义配置
["bashls"] = { settings = { ... } },
```

### 添加格式化工具

编辑 `lua/plugins/lsp/config/formatters.lua`：

- **Mason 可安装的工具** 加入 `M.mason` 表（按文件类型映射）；
- **Mason 不支持的工具** 加入 `M.custom` 表（如 rustfmt、ruff 系列）。

---

## ⌨️ 快捷键总览

### 通用编辑

| 快捷键 | 功能 |
| :----: | ---- |
| `<C-s>` | 保存文件 |
| `<C-a>` | 全选 |
| `j` / `k` | 按显示行移动（自动折行场景） |
| `<A-j>` / `<A-k>` | 向下 / 向上移动当前行（或选中块） |
| `<leader>qq` | 保存全部并退出 |
| `-` | 打开 mini.files 文件管理 |

### 文件查找（`<leader>f`）

| 快捷键 | 功能 |
| :----: | ---- |
| `f` | 查找文件 |
| `s` | 字符快搜（grep_string） |
| `g` | 全局搜索（live_grep） |
| `r` | 高级搜索（live_grep_args） |
| `b` | 查看缓冲区 |
| `o` | 历史文件 |
| `p` | 切换项目 |
| `k` | 快捷键查询 |
| `t` | TODO 查询 |

选择器内：`<A-s>` 分屏打开、`<A-v>` 垂直分屏、`<A-t>` 新标签页打开。

### 缓冲区（`<leader>b`）

| 快捷键 | 功能 |
| :----: | ---- |
| `bb` | 快速切换缓冲区（上一个） |
| `bd` | 删除缓冲区 |
| `bf` | 查询并跳转缓冲区 |
| `bo` | 删除其他缓冲区 |
| `bp` | 切换缓冲区固定状态 |
| `bP` | 删除未固定的缓冲区 |
| `]b` / `[b` | 下一个 / 上一个缓冲区 |

### LSP 操作（`<leader>c`）

| 快捷键 | 功能 |
| :----: | ---- |
| `a` | 代码操作 |
| `d` | 当前行诊断浮窗 |
| `e` | 当前文件诊断 |
| `f` | 文件大纲 |
| `i` | 查找实现 |
| `l` | 引用面板（Trouble） |
| `r` | 查找引用 |
| `R` | 重命名符号 |
| `s` | 切换符号面板（Aerial） |
| `w` | 工作区符号 |
| `W` | 全局诊断 |
| `[` / `]` | 被调列表 / 调用列表 |

### LSP 常用（代码跳转）

| 快捷键 | 功能 |
| :----: | ---- |
| `gd` | 定义跳转 |
| `gD` | 声明跳转 |
| `gi` | 实现跳转 |
| `gr` | 引用查找 |
| `gt` | 类型定义跳转 |
| `K` | Hover 悬浮文档 |
| `<C-k>` | 签名帮助 |
| `[d` / `]d` | 上一个 / 下一个诊断 |
| `<leader>D` | 诊断浮窗 |

### 窗口与分屏（`<leader>w`）

| 快捷键 | 功能 |
| :----: | ---- |
| `wH` / `wJ` / `wK` / `wL` | 窗口移动到左 / 下 / 上 / 右 |
| `<C-Up>` / `<C-Down>` | 增加 / 减少窗口高度 |
| `<C-Left>` / `<C-Right>` | 减少 / 增加窗口宽度 |

### 标签页（`<leader><tab>`）

| 快捷键 | 功能 |
| :----: | ---- |
| `<leader><tab><tab>` | 新建标签页 |
| `<leader><tab>d` | 关闭当前标签页 |
| `<leader><tab>o` | 关闭其他标签页 |
| `<leader><tab>l` / `h` | 下一个 / 上一个标签页 |

### Git（`<leader>g` / `<leader>h`）

| 快捷键 | 功能 |
| :----: | ---- |
| `<leader>gg` | 打开 Lazygit |
| `]c` / `[c` | 下一个 / 上一个修改块（hunk） |
| `<leader>hp` | 预览 Hunk（弹窗） |
| `<leader>hi` | 行内预览 Hunk |
| `<leader>hb` | 显示 blame 弹窗 |
| `<leader>hd` / `hD` | 显示文件差异（索引 / HEAD） |
| `<leader>hq` / `hQ` | 当前文件 / 全部变更到 Quickfix |
| `<leader>ht` | 切换行内 blame 显示 |
| `<leader>hw` | 切换单词级差异 |
| `ih`（操作/可视模式） | 选择整个 Hunk |

### 文件标记（Harpoon，`<leader>m`）

| 快捷键 | 功能 |
| :----: | ---- |
| `ma` / `md` | 添加 / 移除标记 |
| `mm` | 切换 Harpoon 菜单 |
| `m1` / `m2` / `m3` | 跳转到标记 1 / 2 / 3 |
| `m[` / `m]` | 上一个 / 下一个标记 |

### 终端（`<leader>t`）

| 快捷键 | 功能 |
| :----: | ---- |
| `<C-\>` | 切换终端（默认浮动） |
| `tt` | 启用终端 |
| `tv` | 垂直分屏终端 |
| `th` | 水平分屏终端 |
| `tf` | 浮动终端 |
| `<Esc>`（终端内） | 退出到 Normal 模式 |

### 问题查看（Trouble，`<leader>x`）

| 快捷键 | 功能 |
| :----: | ---- |
| `xx` | 文件诊断 |
| `xX` | 工作区诊断 |
| `xL` | 位置列表 |
| `xQ` | Quickfix 列表 |
| `xt` | TODO 面板 |
| `[q` / `]q` | 上一个 / 下一个故障项 |

### 专注面板（Obsess，`<leader>o`）

| 快捷键 | 功能 |
| :----: | ---- |
| `os` | 切换窗口 |
| `oo` / `ol` | 设置定时器 |
| `oa` | 添加任务 |
| `ot` | 切换任务状态 |
| `od` | 删除任务 |
| `oe` | 清空任务列表 |
| `oc` | 关闭 / 注销 |

### 文档预览（`<leader>p`）

| 快捷键 | 功能 |
| :----: | ---- |
| `pm` | Markdown 浏览器预览 |
| `pt` | Typst 预览 |

### 跳转与折叠

| 快捷键 | 功能 |
| :----: | ---- |
| `s` / `S` | Flash 跳转 / Treesitter 跳转 |
| `gl` | Flash 跳转行首 |
| `zR` / `zM` | 展开 / 收起全部折叠 |
| `K`（折叠处） | 预览折叠内容 |

### 启动页（Alpha）

| 快捷键 | 功能 |
| :----: | ---- |
| `p` | 查看项目 |
| `f` | 查找文件 |
| `n` | 新建文件 |
| `s` | 恢复最近会话 |
| `m` | 查看会话 |
| `l` | 打开 Lazy |
| `q` | 退出 |

---

## 🖥️ Neovide 支持

使用 [Neovide](https://github.com/neovide/neovide) 启动时自动加载 `lua/neovide/` 配置：

- 光标粒子特效、行距、原生框线绘制（修复字符边框断裂）
- 原生快捷键：`<D-s>` 保存、`<D-c>` 复制、`<D-v>` 粘贴
- `<C-=>` / `<C-->` 缩放 UI
- 透明方案独立处理：透明插件在 Neovide 中自动禁用，改用 `:TransparentToggle` 命令控制窗口透明度（通过 `neovide_opacity` 实现）

---

## 🧰 常用命令

| 命令 | 说明 |
| ---- | ---- |
| `:Lazy` | 插件管理（安装 / 更新 / 检查更新） |
| `:Mason` | LSP / 工具安装管理 |
| `:ThemeSwitch` | 主题切换选择器 |
| `:Neotree` | 文件树 |
| `:Telescope` | 查找（`find_files` / `live_grep` / `buffers` 等） |
| `:Trouble` | 问题面板 |
| `:LazyGit` | 打开 Lazygit |
| `:ToggleTerm` | 终端 |
| `:MarkdownPreviewToggle` / `:TypstPreviewToggle` | 文档预览 |
| `:PersistenceLoad` | 恢复会话 |
| `:CheckHealth` | 健康检查 |

---

## ❓ 常见问题

**Q: 启动后提示缺少 `lazy.nvim`？**

首次启动自动克隆安装，需要网络可达 GitHub。若失败，手动执行：

```bash
git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

**Q: 文件图标 / 主题图标显示为方块？**

需要安装 Nerd Font 并在终端中设置为默认字体（如 JetBrainsMono Nerd Font、CaskaydiaCove Nerd Font）。

**Q: 某些文件没有代码补全 / 语法高亮？**

- LSP：在 `servers.lua` 中确认已登记对应语言，并检查 `:Mason` 中该服务器是否安装成功；
- 高亮：执行 `:TSInstall <language>` 手动安装解析器。

**Q: 保存时没有自动格式化？**

检查 `formatters.lua` 中该文件类型是否配置了格式化工具，且工具已安装（`conform` 使用失败会以通知提示）。也可以在 LSP 设置中检查是否启用了 `format_on_save`。

**Q: 如何更新插件？**

```vim
:Lazy update
```

**Q: 想清空配置重新开始？**

```bash
rm -rf ~/.local/share/nvim ~/.local/state/nvim
```

---

## 📄 License

MIT
