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
cd /docker-v/private-file-server

mkdir -p "github.com/docker/compose/releases/download/1.29.2/"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o "github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"




```



# 测试

```sh
url="https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"

fileName=$(echo $url | awk -F '/' '{ print $NF}')

```

```sh
# 获取协议
echo "http://www.baidu.com:80/ABCD/a.txt" | awk -F':' '{print $1}'
# 输出http
# 获取域名 
echo "http://www.baidu.com:80/ABCD/a.txt" | awk -F'[/:]' '{print $4}'
# 输出：www.baidu.com
# 获取端口 
echo "http://www.baidu.com:80/ABCD/a.txt" | awk -F'[/:]' '{print $5}'
# 输出 80
# 获取Path 
echo "http://www.baidu.com:80/ABCD/a.txt" | cut -d/ -f4-
# 输出 ABCD/a.txt
```



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
path=$(echo $url | sed 's/http[s]\?:\/\///')
dir=$(echo $path | awk -F '/' ' OFS="/" {$NF="";print}')
mkdir $dir
curl -L $url -o $path
```

