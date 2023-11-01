---
title: Docker_Nextcloud
tags:
- Nextcloud
- docker
---

# 方法一

## 更新避免冲突

```
yum update
```

## 安装 docker

```
yum install -y docker
```

设置自启

```
systemctl start docker
systemctl enable docker
```

## 拉取官方的 Docker 镜像

```
docker pull docker.io/nextcloud
```

## 启用容器

用下面这条，账号设为 admin

```
docker run -d --restart=always --name=nextcloud -p 80:80 -v /nextcloud:/var/www/html/data --privileged=true docker.io/nextcloud
```

## 参考

 [Docker_Nextcloud快速部署个人网盘 - 顾北清 - 博客园 (2021_3_8 下午6_11_54).html](references\Docker_Nextcloud快速部署个人网盘 - 顾北清 - 博客园 (2021_3_8 下午6_11_54).html) 

 [Centos7 Docker 目录挂载_入门试炼06_Gblfy_Blog-CSDN博客 (2021_3_8 下午6_44_08).html](references\Centos7 Docker 目录挂载_入门试炼06_Gblfy_Blog-CSDN博客 (2021_3_8 下午6_44_08).html) 

 [NextCloud 扫描已存在文件命令 - 大家的板块 _ Docker - 小众软件官方论坛 (2021_3_8 下午9_56_56).html](references\NextCloud 扫描已存在文件命令 - 大家的板块 _ Docker - 小众软件官方论坛 (2021_3_8 下午9_56_56).html) 

 [Docker学习笔记：容器挂载多个文件_明洋的专栏-CSDN博客_docker挂载多个目录 (2021_3_8 下午9_32_41).html](references\Docker学习笔记：容器挂载多个文件_明洋的专栏-CSDN博客_docker挂载多个目录 (2021_3_8 下午9_32_41).html) 

# 方法二

```yml


version: '2'

services:
  db:
    image: mariadb
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    restart: always
    volumes:
      - /opt/extra/db:/var/lib/mysql
    ports:
      - "3306:7988"
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_PASSWORD=root
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud

  app:
    container_name: nextcloud
    image: nextcloud
    ports:
      - 8686:80
    depends_on:
      - db
    volumes:
      - /opt/extra/nextcloud:/var/www/html
    restart: always


```

 [Docker部署NextCloud总结 - _Gelandesprung - 博客园 (2021_3_11 上午11_27_14).html](references\Docker部署NextCloud总结 - _Gelandesprung - 博客园 (2021_3_11 上午11_27_14).html) 

# 访问

在浏览器地址栏输入你的IP地址，可以访问到`Nextcloud`的`Web`页面，记得账号设为 admin

# 扫描

NextCloud 安装之后如果并不认得文件夹内已经存在的内容，需要使用 occ 命令扫描，记得把 exec 后面的换成你的容器名即可。

```sh
docker exec nextcloud su www-data -s /bin/bash -c "php /var/www/html/occ files:scan --all"
```

如果你用方法二，那么容器名是 `root_app_1` 

```
docker exec root_app_1 su www-data -s /bin/bash -c "php /var/www/html/occ files:scan --all"
```

## 循环扫描

```sh
for((i=1;i<=80000;i=i+1))
do
    docker exec nextcloud su www-data -s /bin/bash -c "php /var/www/html/occ files:scan --all"
    sleep 600
done
exit 0
```

# 相关命令

```sh
#4.登录容器，查看在/usr/local容器目录下面是否存在nh目录
docker exec -it nextcloud /bin/bash
```

## 无法创建或写入数据目录 /var/www/html/data

```sh
chmod 777 data/
```

## 建立软链接

**ln -s a b** 

a 就是源文件，b是链接文件名,其作用是当进入b目录，实际上是链接进入了a目录 

```
example:ln -s /home/gamestat /gamestat
```

```sh
ls -s ${pwd} /nextclound-admin-files
```

删除软链接：**rm -rf** **b** 
注意不是 **rm -rf** **b/** 

## 显示所有进程

```
ps -ef
```

## 杀死进程

```
kill -9 pid
```

# Errors

## [usr_bin_docker-current_ Error response from daemon_ oci runtime error_ container_linux).html](Errors\usr_bin_docker-current_ Error response from daemon_ oci runtime error_ container_linux.go_235_ star_爱与不爱，一念之间-CSDN博客 (2021_3_8 下午11_39_25).html) 

## [The container name mytomcat  is already in use by container.html](Errors\The container name mytomcat  is already in use by container.html) 

## 删除文件 "Nextcloud intro.mp4-[ImageFromVideo]" 时出错

权限不够

```sh
chmod -R 777 files #表示将整个flie目录与其中的文件和子目录的权限都设置为rwxrwxrwx
```

## 您的数据目录可被其他用户读取

> 您的数据目录可被其他用户读取
>
> 请更改权限为 0770 以避免其他用户查看目录。

 [nextcloud ntfs权限问题 转载_jdyanghang的博客-CSDN博客 (2021_3_11 下午1_17_36).html](Errors\nextcloud ntfs权限问题 转载_jdyanghang的博客-CSDN博客 (2021_3_11 下午1_17_36).html) 



