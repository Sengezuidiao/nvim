[TOC]

## 包管理器
windows的CLI包管理器：
WinGet
Scoop
Chocolatey
MacOS、Linux:
brew




## 主要用途：编程

必备功能：

- 代码补全，通过语言服务器实现
- 语法高亮
  nvim-treesitter,这个在Windows下面各种报错，很奇怪,除了这个目前也没见到更好的。
  nvim-treesitter config in windows:

- 底栏

  - 插件：

- 顶栏
- 文件树
- 快速注释
- 快捷键记忆，相当于很多软件的？

# NeoVim 个人使用的一个哲学思想

## 为什么需要使用 vim

1. 参考软件操作，高频操作使用快捷键提高效率，我认为 vim 也是一样，通过按键映射，把操作捷径化
2. 基于终端的工作流模式，减少分裂感，当然，日常工作中，我自己横跨 Windows、macos 使用很割裂，感觉 windows 各种上古遗物和臃肿，没有 mac 的简洁美，但是又离不开
3. 折腾的乐趣
4. 为什么 no 发行版，体验玩 lazyvim 后，感觉有点过度臃肿，进而学习自己去自定义配置

## 安装过程

# After Installation You Need To

## First of all

- Do `:check health`

## `Python` 虚拟环境设置

### MACOS

The virtual env used here is Python.  
`let g:python3_host_prog=$HOME.'/.config/nvim/python/bin/python'`

cd ~/.config/nvim
python -m venv python
source ./python/bin/activate
pip install cmake-format
pip install pynvim
pip install cmake-language-server

## And also

- install `figlet` for input text ASCII art
  - `brew install figlet`
  - Usaged,[figlet refferent](https://zhuanlan.zhihu.com/p/612411300)
- install ``

改用 nvim，打算将自己的 macbook 以及自己最常用到笔记本电脑到 nvim 配置都统一，打造一个自己最熟悉到编辑环境

# 项目文件夹说明

插件管理器：lazy.nvim

# 所有插件的作用

> 插件配置文件位于 `lua/plugins/`，由 lazy.nvim 按需懒加载；锁定版本见 `lazy-lock.json`。

| 插件 | 配置文件 | 作用 |
| ---- | -------- | ---- |
| lazy.nvim | `lua/config/lazy.lua` | 插件管理器 |
| gruvbox.nvim | `plugins/colorscheme.lua` | 颜色主题（gruvbox） |
| nvim-treesitter | `plugins/treesitter.lua` | 语法高亮（treesitter），markdown 渲染依赖 |
| bufferline.nvim | `plugins/bufferline.lua` | 顶部 buffer 标签栏 |
| lualine.nvim | `plugins/lualine.lua` | 底部状态栏 |
| coc.nvim | `plugins/coc-nvim.lua` | 补全 / LSP / 诊断 / 片段 |
| mini.pairs | `plugins/minipairs.lua` | 括号自动配对 |
| Comment.nvim | `plugins/comment.lua` | 快速注释 / 取消注释 |
| grug-far.nvim | `plugins/grug-far.lua` | 文件内搜索替换 |
| which-key.nvim | `plugins/whichkey.lua` | 快捷键提示 |
| yazi.nvim | `plugins/yazi.lua` | 文件管理器 |
| cmake-tools.nvim | `plugins/cmake-tools.lua` | CMake 生成 / 编译 / 运行 |
| vim-table-mode | `plugins/markdown-table.lua` | Markdown 表格编辑 |
| img-paste.vim | `plugins/markdown-image.lua` | Markdown 粘贴剪贴板图片 |
| render-markdown.nvim | `plugins/render-markdown.lua` | Markdown 实时渲染 |
| csv.vim | `plugins/csv.lua` | CSV 文件编辑 |
| DoxygenToolkit.vim | `plugins/Doxygen.lua` | 生成 Doxygen 注释 |
| lazydev.nvim | `plugins/lazydev.lua` | Lua 开发辅助 |

## COC自动补全

[COC(AutoCompletion)](https://github.com/neoclide/coc.nvim)

# coc 插件管理

coc 扩展通过 `coc_global_extensions` 自动安装（见 `lua/plugins/coc-nvim.lua`），当前启用：

- `coc-json`：JSON 补全 / 校验
- `coc-cmake`：CMake 支持
- `coc-translator`：翻译（快捷键 `ts`）
- `coc-snippets`：片段（配合 Ultisnips）
- `coc-vimlsp`：Vimscript 支持
- `coc-pyright`：Python 补全

## 语言服务器（coc-settings.json）

| 语言 | 服务器 |
| ---- | ------ |
| C / C++ / Objective-C | clangd |
| Lua | lua-language-server |
| QML | qmlls |
| Bash | bash-language-server |

管理扩展命令：`:CocInstall <ext>`、`:CocUninstall <ext>`、`:CocList extensions`。

# 插件使用说明

- **顶部 buffer 栏**：bufferline.nvim，用 `<Space>` + 方向键切换窗口
- **底部状态栏**：lualine.nvim（主题 gruvbox）
- **括号配对**：mini.pairs，输入 `(` `[` `{` `"` `'` 自动补全配对
- **快速注释**：Comment.nvim，`gcc` 注释单行、`gc` 注释选中
- **搜索替换**：grug-far.nvim，`<Space>sr`
- **快捷键提示**：which-key.nvim，按 `<Space>` 后等待即可弹出提示
- **文件管理器**：yazi.nvim，`tt`
- **翻译**：coc-translator，`ts` 翻译光标下单词
- **Doxygen 注释**：DoxygenToolkit.vim，`:Dox` 生成函数注释（C/C++）
- **表格**：vim-table-mode，`:TableModeToggle` 进入表格模式，`<Space>tr` 对齐、`<Space>mts` 排序

# windows 配置 neovim 的坑

Windows 系统中，Neovim 的默认用户配置文件路径位于以下位置：

```
$env:LOCALAPPDATA\nvim
```

插件通常存储在以下目录：

```
$env:LOCALAPPDATA\nvim\nvim\site\pack
```

**查看配置路径**：

打开 Neovim。

执行以下命令：

```
:echo stdpath('config')
```

**自定义配置路径**：

设置 `XDG_CONFIG_HOME` 环境变量来指定新的路径

对于 Windows 用户，可以通过修改环境变量来实现：

打开 **控制面板** > **系统** > **高级系统设置**。

点击 **环境变量**

在用户变量或系统变量中添加或修改 `XDG_CONFIG_HOME` 为你希望的目录。

# 快捷键

> `<Space>` 是 leader 键。完整定义见 `lua/config/keymaps.lua` 与 `lua/config/options.lua`。

## 通用 / 编辑

| 快捷键 | 作用 | 模式 |
| ------ | ---- | ---- |
| `<Space>` `<CR>` | 取消搜索高亮 | `n` |
| `<Space>` `w` | 保存文件 | `n` |
| `<Space>` `q` | 关闭当前窗口 | `n` |
| `<Space>` `<方向键>` | 切换到对应方向窗口 | `n` |
| `<Space>` `=` / `-` | 垂直分屏加宽 / 减窄 | `n` |
| `<C-a>` / `<C-e>` | 插入模式跳到行首 / 行尾 | `i` |
| `<Space>` `/` | 格式化当前文件（`:Format`） | `n` |
| `<F5>` | 编译并运行当前文件（C/C++/QML） | `n` |
| `<Space>` `s` `r` | 搜索替换（grug-far） | `n`/`x` |
| `t` `s` | 翻译光标下单词（coc-translator） | `n` |
| `<Space>` `?` | 显示 buffer 本地快捷键（which-key） | `n` |

## 自动补全 / LSP（COC）

| 快捷键 | 作用 | 模式 |
| ------ | ---- | ---- |
| `<TAB>` / `<S-TAB>` | 补全候选下 / 上一项 | `i` |
| `<CR>` | 确认选中补全项 | `i` |
| `<C-space>` | 触发补全 | `i` |
| `<C-j>` | 触发片段并跳到下一占位符 | `i` |
| `[` `g` / `]` `g` | 上一个 / 下一个诊断 | `n` |
| `g` `d` | 跳转到定义 | `n` |
| `g` `y` | 跳转到类型定义 | `n` |
| `g` `i` | 跳转到实现 | `n` |
| `g` `r` | 查找引用 | `n` |
| `K` | 显示光标下符号文档 | `n` |
| `<Space>` `r` `n` | 重命名符号 | `n` |
| `<Space>` `f` | 格式化选中 | `n`/`x` |
| `<Space>` `z` | 应用最优快速修复 | `n` |
| `<Space>` `a` `c` / `a` `s` | 光标处 / 源码级代码操作 | `n` |
| `<Space>` `a` | 诊断列表（CocList diagnostics） | `n` |
| `<Space>` `o` | 文档大纲 | `n` |
| `<Space>` `s` | 工作区符号搜索 | `n` |
| `<Space>` `e` | 扩展管理 | `n` |
| `<Space>` `c` | 命令列表 | `n` |
| `<Space>` `j` / `k` | 下一个 / 上一个列表项 | `n` |
| `<Space>` `p` | 恢复最近一次 coc 列表 | `n` |

命令：`:Format` 格式化、`:Fold` 折叠、`:OR` 整理 import。

## 快速注释（Comment.nvim）

| 快捷键 | 作用 | 模式 |
| ------ | ---- | ---- |
| `gcc` | 注释 / 取消注释当前行 | `n` |
| `gc` | 注释 / 取消注释选中行 | `v` |

## 文件管理器（yazi.nvim）

| 快捷键 | 作用 | 模式 |
| ------ | ---- | ---- |
| `t` `t` | 打开 yazi（浮动窗口） | `n`/`v` |

## Doxygen 注释

| 命令 | 作用 |
| ---- | ---- |
| `:Dox` | 生成函数头注释（C/C++） |

## Markdown

> `,` 系列片段映射定义于 `lua/config/markdown.lua`，目前被 `disable_markdown_map=true` 整体禁用；如需启用，把该变量改为 `false`。

实时渲染由 render-markdown.nvim 提供（`plugins/render-markdown.lua`）：普通模式渲染、插入模式显示源码，`<Space>mr` 开关渲染。

| 快捷键 | 作用 | 模式 |
| ------ | ---- | ---- |
| `,n` | 插入 `---` 分隔线 | `i` |
| `,b` | 粗体 | `i` |
| `,s` | 删除线 | `i` |
| `,i` | 斜体 | `i` |
| `,d` | 行内代码 | `i` |
| `,c` | 代码块 | `i` |
| `,m` | `- [ ]` 待办 | `i` |
| `,p` | 插入图片 | `i` |
| `,a` | 插入链接 | `i` |
| `,1` ~ `,4` | H1 ~ H4 标题 | `i` |
| `,l` | 分隔线 | `i` |
| `,x` | `- [ ]` 任务项 | `i` |
| `,f` / `<C-e>` | 跳到下一个占位符并清空 | `i` |
| `<Space>` `t` `r` | 表格对齐 | `n` |
| `<Space>` `m` `t` `s` | 表格排序 | `n` |
| `<Space>` `p` | 粘贴剪贴板图片 | `n` |
| `<Space>` `m` `r` | Markdown 实时渲染开关 | `n` |
| `:TableModeToggle` | 进入 / 退出表格模式 | `-` |

# TODO / 已知问题

- [ ] `<Space>q` 关闭窗口映射多了个 `>`（`keymaps.lua`），当前失效
- [ ] lualine 配置键 `options` 应为 `opts`，gruvbox 主题暂未生效
- [ ] yazi 用 `enable=false` 拼写错误，应为 `enabled=false`，当前实际被加载

# C++开发

## 一键编译运行

在 C / C++ / QML 文件中按 `<F5>` 编译并运行当前文件，逻辑见 `lua/config/compilerun.lua`。

## CMake 项目（cmake-tools.nvim）

- `:CMakeGenerate` 生成构建（默认已导出 `compile_commands.json`）
- `:CMakeBuild` 构建
- `:CMakeRun` 运行
- 保存时自动重新生成（`cmake_regenerate_on_save = true`）

## clangd 补全

clangd 需要 `compile_commands.json` 才能正确解析头文件与宏。cmake-tools 会通过软链接自动生成，一般无需手动操作。手动方式：

```
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
mv compile_commands.json ..
```
