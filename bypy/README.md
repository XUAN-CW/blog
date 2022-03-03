---
title: bypy
tags: 
- 百度云
- BT
date: 2022-01-06 18:52:23
id: 1641466344015289300
---
# 摘要

# 摘要

Linux 下BT文件转存百度云。使用 **qBittorrent** 下载 BT 文件，再使用 bypy 将其上传到百度云

# 下载工具

## qBittorrent 

```shell
docker pull crazymax/qbittorrent:4.1.9

mkdir -p /h/qbit 

docker run -d \
  --privileged=true \
  -u root \
  --name=crazymax_qbittorrent \
  -e WEBUI_PORT=8080 \
  -p 9821:6881 \
  -p 9821:6881/udp \
  -p 8:8080 \
  -v /h/qbit:/root/Downloads \
  --restart unless-stopped \
  crazymax/qbittorrent:4.1.9
```

## [aria2-pro](https://hub.docker.com/r/p3terx/aria2-pro) 

按照说明，设置 `RPC_SECRET`， 这里我设置为 `RPC_SECRET=TOKEN` ，下面的图形界面要用

```sh
mkdir -p /h/aria2-pro 
cd /h/aria2-pro 

docker run -d \
  --name aria2-pro \
  --restart unless-stopped \
  --log-opt max-size=1m \
  -e PUID=$UID \
  -e PGID=$GID \
  -e UMASK_SET=022 \
  -e RPC_SECRET=TOKEN \
  -e RPC_PORT=6800 \
  -p 6800:6800 \
  -e LISTEN_PORT=6888 \
  -p 6888:6888 \
  -p 6888:6888/udp \
  -v $PWD/aria2-config:/config \
  -v $PWD/aria2-downloads:/downloads \
  p3terx/aria2-pro
```

### [图形界面](https://github.com/mayswind/AriaNg-Native) 

## 官方网站

https://p3terx.com/archives/docker-aria2-pro.html 

# 上传到百度云：bypy

## 普通安装

bypy需要python3，这里我使用 `centOS8.2` ，它内置 `Python 3.6.8` 。安装步骤如下：

```sh
pip3 install bypy==1.7.12
python3 -m bypy info
##########这个地方需要根据链接获取授权码,然后输入##########
```

 [linux命令行百度云上传下载_onion_rain的博客-CSDN博客.html](assets/references/linux命令行百度云上传下载_onion_rain的博客-CSDN博客.html) 

## docker

```dockerfile
FROM python:3.9.10-slim-bullseye
RUN pip install bypy
```

```
docker image rm bypy:1.0

docker build -t bypy:1.0 .

docker run -it --rm bypy:1.0
```





# 胶水代码

## qbit

胶水代码，可以将下载好的文件上传到百度云。启动程序前，记得在 qBittorrent 设置给未完成的文件添加 **.!qB** 后缀

```sh

runningFlag="runningFlag_$(date +%s)"
echo "删除此文件,程序安全停止 ">${runningFlag}

zipFileFlag="zipFileFlag_$(date +%s)"

for ((i=1; i<=14400; ))
do
    if [ -f ${runningFlag} ];then
        echo "文件存在,程序继续运行"
    else
        echo "文件不存在,程序安全停止"
        break
    fi
    ########## 文件搜索解释 ########################################
    # - 在 qbit 目录下找小于 40G 的文件
    # - 单引号双引号转义
    # - 显示文件大小
    # - 从小大排序
    # - 不要未下载完成的 .!qB 文件
    # - 取最上面的一行路径(经上面排序，取到的是最小的文件)
    shouldBeUploaded=$(find qbit -type f -size -40G 2>/dev/null|grep -v '!qB$'|grep -v parts|grep -v ${zipFileFlag}|sed 's/\([\x20-\x2E\x3A-\x40\x5B-\x60\x7B-\x7E]\)/\\\1/g'|xargs du --exclude="." -m 2>/dev/null| sort -n |sed -n 1p|sed 's/^[0-9]*\x09//g')
    shouldBeUploadedFileSize=$(find qbit -type f -size -40G 2>/dev/null|grep -v '!qB$'|grep -v parts|grep -v ${zipFileFlag}|sed 's/\([\x20-\x2E\x3A-\x40\x5B-\x60\x7B-\x7E]\)/\\\1/g'|xargs du --exclude="." -m 2>/dev/null| sort -n |sed -n 1p|awk '{print $1}')
    empty=""
    if [[ ${empty} = ${shouldBeUploaded} ]] ; then
        echo "empty! sleep 60s"
        sleep 60
        continue
    fi
    
    allAvailableSpace=$(df --block-size=m | grep /dev/vda1 |awk '{print  $4}'|sed 's/\(.*\)\(.\)/\1/g')
    reservedSpace=512
    zipAvailableSpace=$(expr ${allAvailableSpace} - ${shouldBeUploadedFileSize} - ${reservedSpace})
    echo "shouldBeUploaded=${shouldBeUploaded}"
    echo "shouldBeUploadedFileSize=${shouldBeUploadedFileSize}"
    echo "reservedSpace=${reservedSpace}"
    echo "allAvailableSpace=${allAvailableSpace}"
    echo "zipAvailableSpace=${zipAvailableSpace}"
    if [ 0 -gt ${zipAvailableSpace} ]
    then
        echo "space insufficient,stop zip! sleep 60s"
        sleep 60
        continue
    fi
    ###############################################################
    echo "获取文件所在路径"
    upload_dir=$(dirname "${shouldBeUploaded}" | sed $'s/[^[:alnum:]\/]/_/g')
    upload_dir="upload_dir/${upload_dir}/"$(echo "${shouldBeUploaded##*/}"|sed $'s/[^[:alnum:]\/]/_/g')
    echo "upload_dir:${upload_dir}"
    mkdir -p "${upload_dir}"
    ###############################################################
    echo "加密压缩"
    zip -rP Xuan19981224 "${upload_dir}/${zipFileFlag}_$(date +%s).zip" "${shouldBeUploaded}" -m
    ###############################################################
    echo "bypy 上传到百度云"
    bypy syncup "${upload_dir}/" "${upload_dir}/" 
    
    ###############################################################
    # 这里跟一个不存在的目录比较,跟不存在的目录比较后得到的就是所有的远程文件了
    currentPath=`pwd`
    cd "${upload_dir}/"
    bypy -v compare "${upload_dir}/" inexistenceFile | grep '^F' | awk '{print $3}' | xargs -i rm -rf {}
    cd "${currentPath}/"
#    break
    ###############################################################
    echo "删除空文件夹"
    find -type d -empty | sed 's/\(.*\)/\"\1\"/' | xargs rmdir
    ((i++))
done
# nohup ./findAndZipAndUpload.sh > FindAndZipAndUpload.out 2>&1 &

```

## aria2-pro















# 可能用上的知识

### docker 空间清理

 [快速清理Docker垃圾文件，释放硬盘空间 - Rat's Blog.html](assets/references/快速清理Docker垃圾文件，释放硬盘空间 - Rat's Blog.html) 

