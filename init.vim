"
" 下载vimplug 如果vimplug不存在
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs 
			    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC " 启动nvim时候插件一个一个到安装--sync 然后更新source 使vim配置生效
endif

"" ===
""" === system
""" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

if has('win32') || has('win64')
let g:python3_host_prog=$HOME.'/.config/nvim/windowsPythonEnv/neovimpy/Scripts/python.exe'
else
let g:python3_host_prog=$HOME.'/.config/nvim/macPythonEnv/macPythonEnv/bin/python'
endif
set autochdir " 默认情况下，工作目录为启动时到目录，如vim afile afile  :w存到到是当前到工作目录
set exrc      " 允许Vim 在当前目录中查找并执行 .vimrc 文件
set secure    " 禁用shell等外部命令,暂时不知道啥用
set noexpandtab " 使用实际的制表符而不是空格
set tabstop=2     " 一个 Tab 占用 2 列
set shiftwidth=2  "定义在使用 >> 和 << 命令时每一级缩进的列数。同样，这里设置为 2 
set softtabstop=2  "插入模式下按下 Backspace 时删除多少个空格
set autoindent     " 启用自动缩进功能，使得新行的缩进与上一行相同。
set list           "启用可见空格和制表符的显示。这样，你可以看到文本中的空格和制表符，使得排版更加清晰 
set listchars=tab:\|\ ,trail:▫ "定义了在使用 set list 时的字符显示。这里设置制表符显示为 |，空格显示为空格，行尾空白显示为 ▫。
set scrolloff=4     "设置垂直滚动时离顶部和底部的行数。这里设置为 4
set ttimeoutlen=0   "在插入模式中按下键盘键时，如果 Vim 检测到可能是组合键，等待一段时间来判断是否是组合键。这里设置为 0 表示立即处理
set notimeout  " 关闭键盘响应的超时设置，确保按键立即生效。
set viewoptions=cursor,folds,slash,unix  " 表示保存和加载视图时保存和加载光标位置、折叠状态、搜索方向和文件格式
set wrap                         "文本自动换行显示，确保在窗口边缘处的文本会被自动换行显示 
set tw=0                          "文本自动换行显示，确保在窗口边缘处的文本会被自动换行显示
set indentexpr=                   "禁用缩进表达式
set foldmethod=indent              " 使用缩进级别作为折叠的方法
set foldlevel=99                   "99 表示几乎不折叠 
set foldenable                     " 启用折叠功能
set formatoptions-=tc              " 移除 t 和 c 选项，这些选项控制自动换行时的文本格式
set splitright                     "  新窗口在右侧打开
set splitbelow                     "  新窗口在底部打开
"set noshowmode                     "  不显示模式信息，例如插入模式等。
set ignorecase                     " 搜索时忽略大小写
set smartcase                      " 如果搜索项中包含大写字母，则搜索区分大小写；否则，不区分大小写。

set shortmess+=c     "Vim 的命令行输出简短化
set inccommand=split   " 输入 :s 命令时，它会实时地预览替换的效果，而不必等到你按下回车键
set completeopt=longest,noinsert,menuone,noselect,preview  "改善代码补全的体验。completeopt 选项设置了 Vim 补全菜单的行为。这里设置的意义如下：
"longest: 自动补全到最长的公共前缀。
"noinsert: 不会插入不完整的补全文本。
"menuone: 在只有一个匹配项时，自动显示补全菜单。
"noselect: 不自动选择第一项，而是保持插入模式。
"preview: 在菜单中预览当前项

set lazyredraw   " 这个选项可以减少重绘的频率，提高性能。在某些情况下，比如在执行宏时，你可能不希望看到屏幕的闪烁
set visualbell    " 将 Vim 的响铃替换为视觉提示，屏幕会短暂地反白以表示响铃。这是为了避免在终端中产生声音





set mouse=a
set encoding=utf-8
"set clipboard=unnamed " 共享系统剪切版
set clipboard=unnamedplus " 听说更高级

""" 设置备份文件夹
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup
set directory=$HOME/.config/nvim/tmp/backup

" 启用 Vim 的持久撤销功能，并将撤销文件存储在指定的目录中，以确保在重新打开文件时保留撤销历史
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif



"set colorcolumn=100 " 设置在列 100 处绘制一条垂直线，通常用于帮助你保持代码的长度不超过一定限制
set updatetime=100  " 插入模式下，多少毫秒内没有操作时就触发自动命令
set virtualedit=block " 这个设置允许你在可视模式下通过 Ctrl 键调整选区的大小，而无需考虑实际文本的位置

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "光标位置还原到上次关闭文件时的位置






""" 模块化配置
source ~/.config/nvim/vimconfig/look.vim  " 分文件配置，外观相关



" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/autoload')
Plug 'itchyny/vim-cursorword'   "动态高亮当前光标下的单词
" Treesitter  语法高亮相关，暂时不知道有啥用
"Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Pretty Dress 高亮配置
Plug 'theniceboy/nvim-deus'
"Plug 'arzg/vim-colors-xcode'
" Status line  状态栏
Plug 'theniceboy/eleline.vim', { 'branch': 'no-scrollbar' }

" General Highlighter 代码高亮和突出显示
Plug 'NvChad/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
" Auto Complete
Plug 'neoclide/coc.nvim', { 'commit': '63dd239bfe02998810b39d039827e2510885b57b', 'do': 'yarn install --frozen-lockfile' }
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'
" File navigation
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'theniceboy/joshuto.nvim'
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'
" Dart
Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart', 'vim-plug'] }
" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'lewis6991/gitsigns.nvim'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'



call plug#end()


" ==================== Dress up my vim ====================
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
silent! color deus

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" COC补全

source ~/.config/nvim/vimconfig/cocconfig.vim  " 分文件配置coc相关

" ==================== eleline.vim ====================
let g:airline_powerline_fonts = 0
" ==================== gitsigns.nvim ====================
lua <<EOF
require('gitsigns').setup({
	signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
})
EOF
nnoremap H :Gitsigns preview_hunk_inline<CR>
nnoremap <LEADER>gr :Gitsigns reset_hunk<CR>
nnoremap <LEADER>gb :Gitsigns blame_line<CR>
nnoremap <LEADER>g- :Gitsigns prev_hunk<CR>
nnoremap <LEADER>g= :Gitsigns next_hunk<CR>




