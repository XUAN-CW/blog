---
title: nexus3
tags: 
date: 2022-02-12 18:31:11
id: 1644661871858288100
---
# 摘要



```sh
docker run --rm  -p 8081:8081 -p 8083:8083 -v /docker-v/necus3/nexus-data:/nexus-data --privileged=true --name=nexus3 sonatype/nexus3:3.37.3
```



```sh
docker run -itd  -p 8081:8081 -p 8083:8083 -v /docker-v/necus3/nexus-data:/nexus-data --privileged=true --restart=always --name=nexus3 sonatype/nexus3:3.37.3
```



## 访问

http://192.168.0.10:8081/
