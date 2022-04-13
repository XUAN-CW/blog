---
title: 内网穿透
tags: 
date: 2022-04-08 12:34:02
id: 1649392442201117900
---
# 摘要

# 官网

https://github.com/fatedier/frp/releases



# 配置

## 服务端配置

```
# frps.ini

[common]
bind_addr = 0.0.0.0
bind_port = 7000
privilege_token = 12345678

```

## 客户端配置

```
# frpc.ini

[common]
server_addr = 服务端IP
server_port = 7000
privilege_token = 12345678


[httpname]
type = tcp
local_port = 8088
local_ip = 127.0.0.1
remote_port = 8088
```

# 服务器端启动

```
./frps -c ./frps.ini
```



# 客户端启动

linux 下：

```
./frpc -c ./frpc.ini
```

Windows下：

```
./frpc.exe -c ./frpc.ini
```

记得关闭实时防护

# 参考

 [Exposing your local server to the internet over NAT using FRP.html](assets\references\Exposing your local server to the internet over NAT using FRP.html) 

 [利用frp 穿透到内网的http_https网站，实现对外开放.html](assets\references\利用frp 穿透到内网的http_https网站，实现对外开放.html) 



# 测试

[demo](demo) 

http://180.76.247.58:8088/hello

