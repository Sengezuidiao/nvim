# 文件搜索`Everything`  

* 配置,设置自启动，显示窗口快捷键为`Ctrl shift E`
* 高级用法  
  * 常用的搜索方法
    * `空格`： 相当于“与”
    * `|`：相当于“或”
    * `“”`：精准匹配  
    * `*`：匹配一个或多个字符  
    * `？`：匹配一个字符  

# 文本编辑`neovim`  


# 剪切板工具

不过`copyQ`有个缺点，就是无法随机启动，所以这里需要设置一下，设置方法如下：  
win+R打开运行，输入“`shell:Common Startup`”，将copyQ生成快捷方式放入打开的文件件里，即可设置为开机启动  
`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup`

关于自动启动Windows策略不能自启动的问题

# 安全软件  

火绒安全  

# 图吧工具箱

# 删除系统假的curl的别名并下载真的

`https://curl.se/windows/`

```
Remove-Item -Path Alias:curl -ErrorAction SilentlyContinue
```

# windows Terminal 美化  

