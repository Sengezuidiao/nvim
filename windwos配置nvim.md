#转战NeoVim  


windows 安装neovim

`winget install neovim `


search那里，搜neovim，打开文件所在目录，将相应的文件添加到系变量，这个不是新手就不教了


自定义config文件的位置和苹果电脑的保一致

新建环境变量
`XDG_CONFIG_HOME`

$HOME\.config\
建立配置文件的文件夹
mkdir -p $HOME\.config\nvim 建立文件夹，手动建立也一样
`cd .config 在这git clone git@github.com:Sengezuidiao/nvim.git`


给nvim起别名
管理员打开终端
Set-ExecutionPolicy RemoteSigned
New-Item -ItemType File -Path $PROFILE -Force
nvim $PROFILE 
在文件中添加
```
New-Alias -Name vim -Value nvim
```
执行配置文件
.$PROFILE


# 插件的安装  
安装node 添加到path  
coc.nvim的配置  
npm install -g yarn



cd ~/.config/nvim/plugged/coc.nvim
yarn install --frozen-lockfile
yarn build

# nvim-treesitter 这个插件安装的大坑
高亮C语言还得安装clangd,我好像是用winget安装的然后用everything搜索添加到环境变量
TSIntall c 插件
TSIntall lua
TSIntall vim
解决报错 Ts


# 插件安装  
## Markdown  
```
npm -g install instant-markdown-d

```
