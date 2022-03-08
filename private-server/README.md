---
title: private-server
tags: 
date: 2022-03-01 20:56:07
id: 1646139367829383000
---
# 摘要





# nexus3

```sh
docker container rm -f nexus3
rm -rf /docker-v/nexus3/
mkdir -p /docker-v/nexus3/nexus-data
chmod 777 -R /docker-v/nexus3/
docker run -itd  \
  -p 7000:8081 \
  -p 7001-7100:7001-7100 \
  -v /docker-v/nexus3/nexus-data:/nexus-data \
  --privileged=true \
  --restart=always \
  --name=nexus3 \
  sonatype/nexus3:3.16.2
```

# 文件服务

```sh
docker run -itd \
  --name private-file-server \
  -p 7101:80 \
  -v /docker-v/private-file-server:/usr/share/nginx/html \
  nginx:1.16.1
  
```

```sh
# docker-compose
mkdir -p /docker-v/private-file-server/docker-compose
cd /docker-v/private-file-server/docker-compose

mkdir -p "github.com/docker/compose/releases/download/1.29.2/"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o "github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"




```











