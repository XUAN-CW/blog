---
title: localcache
tags: 
- win10
- nginx
- cache
- 静态IP
date: 2022-01-10 05:13:19
id: 1641762799502955600
---
# 摘要



# 实现步骤

## win10虚拟网卡怎么设置ip地址

### 参考

 [win10虚拟网卡怎么设置ip地址.html](assets\references\win10虚拟网卡怎么设置ip地址.html) 

## 设置静态IP地址

![image-20220110052253505](assets/images/image-20220110052253505.png)



## nginx

### 下载

- http://nginx.org/download/nginx-1.16.1.zip

### 配置

```
    server {
        listen 80;
        server_name localhost;
        root   C:/cache/software-for-development;
        location / {
            index  index.html index.htm;
        }
    }
```

### 开机自启动

创建快捷方式到 [StartUp](C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp) 即可开机自启动



# 可能有用的命令

## 硬链接

```
mklink /H  源文件的硬链接 源文件
```

