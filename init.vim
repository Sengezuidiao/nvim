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
set mouse=a
set encoding=utf-8
set clipboard=unnamed " 共享系统剪切版

source ~/.config/nvim/vimconfig/look.vim  " 分文件配置，外观相关

call plug#begin('$HOME/.config/nvim/autoload')
call plug#end()

