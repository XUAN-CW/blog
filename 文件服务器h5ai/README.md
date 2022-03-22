---
title: 文件服务器h5ai
tags: 
date: 2022-03-22 13:12:26
id: 1647925946169489900
---
# 摘要



```sh
docker run -d --name=h5ai \
 -p 80:80 \
-v /shared/dir:/h5ai \
-v /config/dir:/config \
-e TZ=Asia/Seoul \
--restart unless-stopped \
awesometic/h5ai
```

