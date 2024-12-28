" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/autoload')
Plug 'itchyny/vim-cursorword'   " Underlines the word under the cursor
" Treesitter  语法解析高亮
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

" Snippets
Plug 'theniceboy/vim-snippets'

" Vim Applications
Plug 'itchyny/calendar.vim'
call plug#end()


