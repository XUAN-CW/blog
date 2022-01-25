---
title: yum搭建本地仓库
tags: 
date: 2022-01-25 13:58:56
id: 1643090336750268300
---
# 摘要

# 步骤

## 创建仓库

## 暴露仓库

```
    server {
        listen 100;
        server_name localcache;
        location / {
            root   C:/cache/;
            autoindex on;
            index  index.html index.htm;
        }
    }
```



## 指向仓库

# 参考

 [Creating local yum repo for scylladb and install it within private network.html](assets\references\Creating local yum repo for scylladb and install it within private network.html) 





