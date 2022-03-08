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

## 安装

```sh
docker run -itd \
  --name file-private-server \
  -p 7101:80 \
  -v /docker-v/file-private-server:/usr/share/nginx/html \
  nginx:1.16.1
  
cd /docker-v/file-private-server
# 下载脚本放在此目录下
```

## 下载脚本

```sh
#!/bin/bash 
##############################################
# 脚本名称：
#   download-to-original-path.sh
# 作用：
#   
# 语法：
#   
# 启动示例：
##############################################
if [ -z "$1" ]; then
  echo "empty url"
  exit 1
fi

url=$1
echo "url=$url"
path=$(echo $url | sed 's/http[s]\?:\/\///')
dir=$(echo $path | awk -F '/' ' OFS="/" {$NF="";print}')
mkdir -p $dir
curl -L $url -o $path

```

## 常用文件

```sh
chmod 777 download-to-original-path.sh 
./download-to-original-path.sh "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"







```

