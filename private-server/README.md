---
title: private-server
tags: 
date: 2022-03-01 20:56:07
id: 1646139367829383000
---
# 摘要



```sh
docker run -itd \
  --name private-file-server \
  -p 7101:80 \
  -v /some/content:/usr/share/nginx/html \
  nginx:1.16.1
```

