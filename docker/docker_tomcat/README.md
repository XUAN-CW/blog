---
title: docker_tomcat
date: 2021-05-16 10:16:44
tags: 
- docker
- tomcat
categories: 
---



# 启动

```bash
docker run -d \
  --name tomcat \
  -p 8080:8080 \
  -v /docker-v/tomcat/temp:/usr/local/tomcat/temp \
  -v /docker-v/tomcat/webapps:/usr/local/tomcat/webapps \
  tomcat:9.0.45-jdk8-corretto
```



# 解决404

```sh
docker ps
```

```bash
docker exec -it tomcat /bin/bash
```

```bash
rm -rf webapps
```

```bash
mv webapps.dist webapps
```

 [Docker入门 安装Tomcat以及报404解决方案 - 一半人生 - 博客园.html](references\Docker入门 安装Tomcat以及报404解决方案 - 一半人生 - 博客园.html) 









