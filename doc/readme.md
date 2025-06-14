[TOC]

# NeoVim 使用的一个心路历程

## 捣鼓 vim 个人认为需要的知识储备

1. github 的使用，去了解怎么配置，用来管理自己的配置，相当于其实是做了一个云备份
1. 环境变量的作用的认知，还有对系统路径的了解，比如说 windows 的$env:LOCALAPPDATA 这种奇奇怪怪的东西是干什么用的
1. 包管理器，windows 下面的 cargo，winget，macos 的 brew，以其包管理器下载东西的路径，方便后期卸载的垃圾清理和 bug 调式，linux 的 apt，当然找不到也没关系，这些都可以借助 everything 找到
1. lua、vimscript、开发语言环境的配置，因为 neovim 很多插件依赖自己编译构建的，这就需要配置好编译环境，当然大部分都是可以通过包管理器输入文档给的指令去解决

# Neovim 至少需要具备哪些东西

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

## And also

- install `figlet` for input text ASCII art
  - `brew install figlet`
  - Usaged,[figlet refferent](https://zhuanlan.zhihu.com/p/612411300)
- install ``

改用 nvim，打算将自己的 macbook 以及自己最常用到笔记本电脑到 nvim 配置都统一，打造一个自己最熟悉到编辑环境

# 项目文件夹说明

插件管理器：lazy.nvim

# 所有插件的作用

## Plugins Keybindings

## COC自动补全

[COC(AutoCompletion)](https://github.com/neoclide/coc.nvim)

# coc 插件管理

[extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

coc-yank provides yank highlights & history.
coc-css for css, scss and less.
coc-clangd for C/C++/Objective-C, use clangd
coc-explorer File Explorer extension
coc-html for html, handlebars and razor.
coc-docker for dockerfile.
coc-json for json.
coc-lists provides some basic lists like fzf.vim.
coc-prisma for Prisma schema integration.
coc-yaml for yaml

# 插件使用说明

`itchyny/vim-cursorword` 光标下的单词添加下划线显示，文件内有的都添加

- 代码高亮 nvim-treesitter  
  `nvim-treesitter/nvim-treesitter`

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

## 自动补全（COC 插件）

| 快捷键          | 作用                                                          | 模式 |
| --------------- | ------------------------------------------------------------- | ---- |
| `Space` `y`     |                                                               |      |
| `g` `d`         | Go define,跳转到定义出，配合`Ctrl` `o`， `Ctrl` `i`可以来回跳 | `n`  |
| `g` `r`         |                                                               |      |
| `g` `i`         |                                                               |      |
| `Space` `r` `n` | 变量重命名                                                    | `n`  |
| `Ctrl` `j`      | 跳转到下一个参数（占位符）                                    | `i`  |
|                 |                                                               |      |

## 左侧文件浏览器（nvim-tree）

| 快捷键  | 作用           | 模式 |
| ------- | -------------- | ---- |
| `t` `t` | 打开左侧文件树 | `n`  |
| `q`     | 退出文件树     | `n`  |
|         |                |      |

快速注释，取消注释(numToStr/Comment.nvim)
gcc 注释单行，取消单行注释
gc 注释选中行，取消选中行注释

## MarkDown

| Shortcut             | What it creates       | mode |
| -------------------- | --------------------- | ---  |
| `,n`                 | ---                   | `n`  |
| `,b`                 | **Bold** text         | `n`  |
| `,s`                 | ~~sliced~~ text       | `n`  |
| `,i`                 | *italic* text         | `n`  |
| `,d`                 | `code block`          | `n`  |
| `,c`                 | big `block of code`   | `n`  |
| `,m`                 | - [ ] check mark      | `n`  |
| `,p`                 | picture               | `n`  |
| `,a`                 | [link]()              | `n`  |
| `,1`                 | # H1                  | `n`  |
| `,2`                 | ## H2                 | `n`  |
| `,3`                 | ### H3                | `n`  |
| `,4`                 | #### H4               | `n`  |
| `<leader>` `t` `s`   | MarkDown 表格排序     | `n`  |
| `<leader>` `t` `r`   | MarkDown 表格对齐     | `n`  |
| `<leader>` `t` `m`   | 打开表格模式          | `n`  |
| `leader` `p`         | 粘贴剪切板的图片      | `n`  |

# TODO

文件内容搜索

# C++开发

通过CMAKE生成补全文件  
`cd build`  
`cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..`  
`mv compile_commands.json ..`

