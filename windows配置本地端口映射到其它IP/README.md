---
title: windows配置本地端口映射到其它IP
tags: 
- win10
- port
- environment
- reinstall
- 端口映射
date: 2022-02-14 15:59:39
id: 1644825579353493400
---
# 摘要



# Netsh interface portproxy

- 相比使用专业软件，这套命令只支持 **TCP** 
- 不能使用127.0.0.1作为连接地址
- 请确保防火墙（Windows防火墙或通常包含在杀毒软件中的第三方防火墙）允许到新端口的传入连接
- 请确保在服务里面开启IP Helper服务

# 常用命令

## 添加一个端口映射

```
C:\Users\33719>netsh interface portproxy add ?

下列指令有效:

此上下文中的命令:
add v4tov4     - 添加通过 IPv4 的 IPv4 和代理连接到的侦听项目。
add v4tov6     - 添加通过 IPv6 的 IPv4 和代理连接到的侦听项目。
add v6tov4     - 添加通过 IPv4 的 IPv6 和代理连接到的侦听项目。
add v6tov6     - 添加通过 IPv6 的 IPv6 和代理连接到的侦听项目。

C:\Users\33719>netsh interface portproxy add v4tov4 ?

用法: add v4tov4 [listenport=]<integer>|<servicename>
            [connectaddress=]<IPv4 address>|<hostname>
            [[connectport=]<integer>|<servicename>]
            [[listenaddress=]<IPv4 address>|<hostname>]
            [[protocol=]tcp]

参数:

        标记            值
        listenport      - IPv4 侦听端口。
        connectaddress  - IPv4 连接地址。
        connectport     - IPv4 连接端口。
        listenaddress   - IPv4 侦听地址。
        protocol        - 使用的协议。现在只支持 TCP。

说明: 添加通过 IPv4 的 IPv4 和代理连接到的侦听项目。



C:\Users\33719>
```

实例：

```bat
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=8080 connectaddress=192.168.18.10 connectport=8080
```

## 查看存在的转发

```
C:\Users\33719>netsh interface portproxy show ?

下列指令有效:

此上下文中的命令:
show all       - 显示所有端口代理参数。
show v4tov4    - 显示 IPv4 代理连接到另一个 IPv4 端口的参数。
show v4tov6    - 显示 IPv4 代理连接到 IPv6 的参数。
show v6tov4    - 显示 IPv6 代理连接到 IPv4 的参数。
show v6tov6    - 显示 IPv6 代理连接到另一个 IPv6 端口的参数。

C:\Users\33719>
```

实例：

```bat
netsh interface portproxy show all
```

## 删除一个端口映射

```
C:\Users\33719>netsh interface portproxy delete v4tov4 ?

用法: delete v4tov4 [listenport=]<integer>|<servicename>
            [[listenaddress=]<IPv4 address>|<hostname>]
            [[protocol=]tcp]

参数:

       标记             值
       listenport     - 要侦听的 IPv4 端口。
       listenport     - 要侦听的 IPv4 地址。
       protocol       - 要使用的协议。当前仅支持 TCP。

注释: 删除要侦听的 IPv4 的项并通过 Ipv4 代理连接。



C:\Users\33719>
```

实例：

```bat
netsh interface portproxy delete v4tov4 listenaddress=localhost listenport=8080
```

## 清除所有当前的端口转发规则

```
C:\Users\33719>netsh interface portproxy reset ?

用法: reset

备注: 重置 portproxy 配置状态。



C:\Users\33719>
```

实例：

```bat
netsh interface portproxy reset
```

# 常用端口

```
rem RabbitMQ 管理界面
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=15672 connectaddress=192.168.18.10 connectport=15672

rem mysql
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=3306 connectaddress=192.168.18.10 connectport=3306

rem zookeeper
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=2181 connectaddress=192.168.18.10 connectport=2181

rem docker remote api
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=2375 connectaddress=192.168.18.10 connectport=2375

rem redis
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=6379 connectaddress=192.168.18.10 connectport=6379

rem elasticsearch
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=9200 connectaddress=192.168.18.10 connectport=9200
rem kibana
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=5601 connectaddress=192.168.18.10 connectport=5601

rem nacos
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=8848 connectaddress=192.168.18.10 connectport=8848
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=8848 connectaddress=192.168.18.10 connectport=9848

rem Oracle
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=1521 connectaddress=192.168.18.10 connectport=1521

rem kafka
netsh interface portproxy add v4tov4 listenaddress=localhost listenport=9092 connectaddress=192.168.18.10 connectport=9092
```

# references

 [windows配置本地端口映射到其它电脑.html](assets\references\windows配置本地端口映射到其它电脑.html) 

 [windows下开启端口映射配置办法.html](assets\references\windows下开启端口映射配置办法.html) 

 [使用netsh interface portproxy进行端口转发.html](assets\references\使用netsh interface portproxy进行端口转发.html) 
