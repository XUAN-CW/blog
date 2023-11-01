---
title: docker_consul
date: 2021-07-20 21:18:02
tags: 
categories: 
id: 1626787082074900900
---

# 安装

```sh
docker pull consul:1.6.1
```

```sh
docker run --name consul -d --restart=always --privileged=true -p 8500:8500 consul:1.6.1
```

# 访问

http://192.168.18.10:8500