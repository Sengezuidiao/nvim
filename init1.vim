" 下载vimplug 如果vimplug不存在
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
    silent! curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs 
			    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC " 启动nvim时候插件一个一个到安装--sync 然后更新source 使vim配置生效
endif
let g:nvim_plugins_installation_completed=1
" Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location 
let has_machine_specific_file = 1
if empty(glob($HOME.'/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	if has('win32') || has('win64')
		silent! exec '!copy ' . expand('$HOME/.config/nvim/default_configs/_machine_specific_win.vim') . ' ' . expand('$HOME/.config/nvim/_machine_specific.vim')
	else
		silent! exec "!cp $HOME/.config/nvim/default_configs/_machine_specific_mac.vim $HOME/.config/nvim/_machine_specific.vim"
	endif
endif
source $HOME/.config/nvim/_machine_specific.vim
"" ===
""" === system
""" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


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
	set undodir=$HOME/.config/nvim/tmp/undo
endif



"set colorcolumn=100 " 设置在列 100 处绘制一条垂直线，通常用于帮助你保持代码的长度不超过一定限制
set updatetime=100  " 插入模式下，多少毫秒内没有操作时就触发自动命令
set virtualedit=block " 这个设置允许你在可视模式下通过 Ctrl 键调整选区的大小，而无需考虑实际文本的位置

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "光标位置还原到上次关闭文件时的位置

" ==================== Basic Mappings ====================
let mapleader=" "   " 将leader按键设置为空格键
" Search
noremap <LEADER><CR> :nohlsearch<CR>   " 空格回车取消搜索的高亮
" Find pair
noremap ,. %


" ==================== Insert Mode Cursor Movement ====================
inoremap <C-a> <ESC>A
inoremap <C-Enter> <ESC>o
inoremap <C-S-Enter> <Esc>O

" ==================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER><Up> <C-w>k
noremap <LEADER><Down> <C-w>j
noremap <LEADER><Left> <C-w>h
noremap <LEADER><Right> <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap s<Up> :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap s<Down> :set splitbelow<CR>:split<CR>
noremap s<Left> :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap s<Right> :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
noremap w<up> :res +5<CR>
noremap w<down> :res -5<CR>
noremap w<left> :vertical resize-5<CR>
noremap w<right> :vertical resize+5<CR>

" Press <SPACE> + q to close the other window 
noremap <LEADER>q :only<CR>


" ==================== Markdown Settings ====================
" Snippets
source $HOME/.config/nvim/vimconfig/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

""" 模块化配置
source ~/.config/nvim/vimconfig/look.vim  " 分文件配置，外观相关

""" 加载插件模块
source ~/.config/nvim/vimconfig/plugins.vim


" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/autoload')
Plug 'itchyny/vim-cursorword'   " Underlines the word under the cursor
" Treesitter  语法解析高亮,代码高亮
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Pretty Dress 高亮配置
Plug 'theniceboy/nvim-deus'
"Plug 'arzg/vim-colors-xcode'
" Status line  状态栏
Plug 'theniceboy/eleline.vim', { 'branch': 'no-scrollbar' }

" General Highlighter 代码高亮和突出显示
Plug 'NvChad/nvim-colorizer.lua'   "高性能荧光笔
Plug 'RRethy/vim-illuminate'     " 光标下突出显示

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'wellle/tmux-complete.vim'  "vim 与TMUX结合，目前用不到


" File navigation 文件查找
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if has('mac')
	Plug 'theniceboy/joshuto.nvim' " MAC下使用的啥joshuto终端文件管理器
endif
	"Plug 'kevinhwang91/rnvimr'   "Rnvimr is a NeoVim plugin that allows you to use Ranger in a floating window,目前没有用ranger.
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'lewis6991/gitsigns.nvim'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

" Find & Replace
Plug 'nvim-lua/plenary.nvim' " nvim-spectre dep
Plug 'nvim-pack/nvim-spectre'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
call plug#end()


" Snippets
Plug 'theniceboy/vim-snippets'

" Vim Applications
Plug 'itchyny/calendar.vim'


" ==================== joshuto.nvim ====================
noremap <silent> R :Joshuto<CR>
let g:joshuto_floating_window_winblend = 0
let g:joshuto_floating_window_scaling_factor = 1.0
let g:joshuto_use_neovim_remote = 1 " for neovim-remote support

" ==================== Dress up my vim ====================
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
silent! color deus
" ==================== vim-calendar ====================
"noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END



hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" COC补全

source ~/.config/nvim/vimconfig/cocconfig.vim  " 分文件配置coc相关

" ==================== eleline.vim ====================
let g:airline_powerline_fonts = 0
" ==================== gitsigns.nvim ====================
" lua <<EOF
" require('gitsigns').setup({
" 	signs = {
"     add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
"     change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
"     delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
"     topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
"     changedelete = { hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
"     untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
"   },
" })
" EOF
" nnoremap H :Gitsigns preview_hunk_inline<CR> "当光标位于某一行上时，按下 H 键，将显示当前行的 git diff
" nnoremap <LEADER>gr :Gitsigns reset_hunk<CR> "当光标位于某一行上时，按下 <Leader>gr 键，将重置当前行的 git diff
" nnoremap <LEADER>gb :Gitsigns blame_line<CR> "当光标位于某一行上时，按下 <Leader>gb 键，将显示当前行的 git blame 信息
" nnoremap <LEADER>g- :Gitsigns prev_hunk<CR>   " 将移动到上一个 git diff 区域
" nnoremap <LEADER>g= :Gitsigns next_hunk<CR>    " 移动到下一个 git diff 区域



" ==================== nvim-treesitter ===================="
"
lua <<EOF
    require'nvim-treesitter.install'.compilers = { "clang","gcc" }
EOF


" ==================== fzf-lua ====================
" 这里待查看怎么用
noremap <silent> <C-p> :FzfLua files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :FzfLua oldfiles cwd=~<CR>
noremap <silent> <C-q> :FzfLua builtin<CR>
noremap <silent> <C-t> :FzfLua lines<CR>
" noremap <silent> <C-x> :FzfLua resume<CR>
noremap <silent> z= :FzfLua spell_suggest<CR>
noremap <silent> <C-w> :FzfLua buffers<CR>
noremap <leader>; :History:<CR>
augroup fzf_commands
  autocmd!
  autocmd FileType fzf tnoremap <silent> <buffer> <c-j> <down>
  autocmd FileType fzf tnoremap <silent> <buffer> <c-k> <up>
augroup end
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'fzf-lua'.setup {
	global_resume = true,
	global_resume_query = true,
	winopts = {
		height = 0.95,
		width = 0.95,
		preview = {
			scrollbar = 'float',
		},
		fullscreen = false,
		vertical       = 'down:45%',      -- up|down:size
		horizontal     = 'right:60%',     -- right|left:size
		hidden         = 'nohidden',
	},
	keymap = {
		-- These override the default tables completely
		-- no need to set to `false` to disable a bind
		-- delete or modify is sufficient
		builtin = {
			["<c-f>"]      = "toggle-fullscreen",
			["<c-r>"]      = "toggle-preview-wrap",
			["<c-p>"]      = "toggle-preview",
			["<c-y>"]      = "preview-page-down",
			["<c-l>"]      = "preview-page-up",
			["<S-left>"]   = "preview-page-reset",
		},
		fzf = {
			["esc"]        = "abort",
			["ctrl-h"]     = "unix-line-discard",
			["ctrl-k"]     = "half-page-down",
			["ctrl-b"]     = "half-page-up",
			["ctrl-n"]     = "beginning-of-line",
			["ctrl-a"]     = "end-of-line",
			["alt-a"]      = "toggle-all",
			["f3"]         = "toggle-preview-wrap",
			["f4"]         = "toggle-preview",
			["shift-down"] = "preview-page-down",
			["shift-up"]   = "preview-page-up",
			["ctrl-e"]     = "down",
			["ctrl-u"]     = "up",
		},
	},
  previewers = {
    cat = {
      cmd             = "cat",
      args            = "--number",
    },
    bat = {
      cmd             = "bat",
      args            = "--style=numbers,changes --color always",
      theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
      config          = nil,            -- nil uses $BAT_CONFIG_PATH
    },
    head = {
      cmd             = "head",
      args            = nil,
    },
    git_diff = {
      cmd_deleted     = "git diff --color HEAD --",
      cmd_modified    = "git diff --color HEAD",
      cmd_untracked   = "git diff --color --no-index /dev/null",
      -- pager        = "delta",      -- if you have `delta` installed
    },
    man = {
      cmd             = "man -c %s | col -bx",
    },
    builtin = {
      syntax          = true,         -- preview syntax highlight?
      syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
      syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
    },
  },
  files = {
    -- previewer      = "bat",          -- uncomment to override previewer
                                        -- (name from 'previewers' table)
                                        -- set to 'false' to disable
    prompt            = 'Files❯ ',
    multiprocess      = true,           -- run command in a separate process
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    -- executed command priority is 'cmd' (if exists)
    -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
    -- default options are controlled by 'fd|rg|find|_opts'
    -- NOTE: 'find -printf' requires GNU find
    -- cmd            = "find . -type f -printf '%P\n'",
    find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
    rg_opts           = "--color=never --files --hidden --follow -g '!.git'",
    fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
  },
  buffers = {
    prompt            = 'Buffers❯ ',
    file_icons        = true,         -- show file icons?
    color_icons       = true,         -- colorize file|git icons
    sort_lastused     = true,         -- sort buffers() by last used
  },
}
EOF
endif

" ==================== markdown-Preview ====================



noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
endif
endfunc
