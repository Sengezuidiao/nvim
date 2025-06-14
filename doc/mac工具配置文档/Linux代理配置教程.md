树莓派等Linux树莓派代理配置教程  
1、下载对应的clash内核  
[clash内核下载](https://github.com/Kuingsmile/clash-core/releases)
根据自己的系统架构下载对应的包  

```
在终端 cd 到 Clash 二进制文件所在的目录，执行命令，私人配置命令，下载clash 配置文件
```

```
执行 ./clash -d . 即可启动 Clash，同时启动 HTTP 代理和 Socks5 代理。

如提示权限不足，请执行 chmod +x clash

```

```
访问 Clash Dashboard 可以进行切换节点、测延迟等操作。

Host: 127.0.0.1，端口: 9090
```

```
以 Ubuntu 19.04 为例，打开系统设置，选择网络，点击网络代理右边的 ⚙ 按钮，选择手动，填写 HTTP 和 HTTPS 代理为 127.0.0.1:7890，填写 Socks 主机为 127.0.0.1:7891，即可启用系统代理。
```

树莓派可以配置代理的三个地方  
`/etc/environment`
`~/.bashrc`
`~/.bash_profile`

