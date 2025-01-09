[TOC]

# NeoVim使用的一个心路历程

## 捣鼓vim个人认为需要的知识储备

1. github的使用，去了解怎么配置，用来管理自己的配置，相当于其实是做了一个云备份
1. 环境变量的作用的认知，还有对系统路径的了解，比如说windows的$env:LOCALAPPDATA这种奇奇怪怪的东西是干什么用的
1. 包管理器，windows下面的cargo，winget，macos的brew，以其包管理器下载东西的路径，方便后期卸载的垃圾清理和bug调式，linux的apt，当然找不到也没关系，这些都可以借助everything找到
1. lua、vimscript、开发语言环境的配置，因为neovim很多插件依赖自己编译构建的，这就需要配置好编译环境，当然大部分都是可以通过包管理器输入文档给的指令去解决

# Neovim至少需要具备哪些东西

## 主要用途：编程

- 代码补全，通过语言服务器实现
- 语法高亮
- 底栏
- 顶栏
- 文件树
- 快速注释
- 

# NeoVim个人使用的一个哲学思想

## 为什么需要使用vim

1. 参考软件操作，高频操作使用快捷键提高效率，我认为vim也是一样，通过按键映射，把操作捷径化
2. 基于终端的工作流模式，减少分裂感，当然，日常工作中，我自己横跨Windows、macos使用很割裂，感觉windows各种上古遗物和臃肿，没有mac的简洁美，但是又离不开
3. 折腾的乐趣
4. 

# After Installation You Need To 

## First of all 
* Do `:check health`
## Config `Python` Path  

### MACOS
The virtual env used here is Python.  
`let g:python3_host_prog=$HOME.'/.config/nvim/macPythonEnv/macPythonEnv/bin/python'`

### Linux


The virtual env used here is Python.  
`let g:python3_host_prog=$HOME.'/.config/nvim/macPythonEnv/macPythonEnv/bin/python'`
## And also...
* install `figlet` for input text ASCII art
  * `brew install figlet`
  * Usaged,[figlet refferent](https://zhuanlan.zhihu.com/p/612411300) 
* install ``

改用nvim，打算将自己的macbook以及自己最常用到笔记本电脑到nvim配置都统一，打造一个自己最熟悉到编辑环境

# 项目文件夹说明

插件管理器：vim-plug

```

├── autoload 
│   └── plug.vim
├── init.vim
├── readme.md
├── tmp   //临时文件
│   └── backup //备份文件
│       ├── 1.c.swp
│       └── init.vim~
└── vimconfig
    └── look.vim
```

# 所有插件的作用



# Keyboard Shortcuts

## Basic Editor Feature
### The Most Basics
``


# Plugins Keybindings
## AutoCompletion
### coc(AutoCompletion)

# 使用说明  
## Plugins Keybindings  
## AutoCompletion
[COC(AutoCompletion)](https://github.com/neoclide/coc.nvim)  


# coc插件管理(https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)
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
* 代码高亮nvim-treesitter  
`nvim-treesitter/nvim-treesitter`  

# windows配置neovim的坑

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
