---
title: 文件服务器
tags: 
date: 2022-09-15 22:27:34
id: 1663252054565439700
---
# 摘要

https://github.com/codeskyblue/gohttpserver

```sh
docker run -itd \
  -p 8000:8000 \
  -v $PWD:/app/public \
  --name gohttpserver \
  codeskyblue/gohttpserver
```

