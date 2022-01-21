---
title: nginx代理资源中有中文路径
tags: 
- nginx 
- windows
- error
date: 2022-01-22 02:11:54
id: 1642788714250927800
---
# 摘要



# 问题描述

使用下面的 server ，无法正常代理

```
    server {
        listen 500;
        server_name h;
        location / {
            root   "E:/高清动画";
            autoindex on;
            index  index.html index.htm;
        }
    }
```

# 解决方案

见 [参考](#参考) 

# 参考

 [window nginx 中文路径, 文件名乱码问题解决.html](assets\references\window nginx 中文路径, 文件名乱码问题解决.html) 

 [把windows系统的默认编码改成UTF-8.html](assets\references\把windows系统的默认编码改成UTF-8.html) 







