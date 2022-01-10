---
title: yum保存要安装的rpm包及其依赖包
tags: 
- centOS
- Linux
- yum 
- 离线
date: 2022-01-04 18:00:43
id: 1641290443790725200
---
# 概述

yum保存要安装的rpm包及其依赖包

## 只下载不安装

```sh
# yum自动下载 vim RPM 包及其所有依赖的包至 /rpm/vim 目录：
yum install vim --downloadonly --downloaddir=/rpm/vim
# 切换到下载目录中批量安装 vim
cd /rpm/vim
rpm -ivh *.rpm
```

## 不删除rpm包

 yum 默认情况下，升级或者安装后，会删除下载的rpm包，这里可以设置升级后不删除下载的 rpm 包

```sh
sudo sed -i 's/keepcache=0/keepcache=1/' /etc/yum.conf
```

## 修改 cachedir

设置 yum 下载目录，修改下面这个配置即可：

```
# vi /etc/yum.conf
cachedir=/var/cache/yum/$basearch/$releasever
```

我想把它修改成 `/yum-cachedir` ，快捷命令如下：

```sh
sudo sed -i 's/cachedir=\/var\/cache\/yum\/\$basearch\/\$releasever/cachedir=\/yum-cachedir/' /etc/yum.conf
```

# yum-install

```sh
touch /usr/local/bin/yum-install
chmod 777 /usr/local/bin/yum-install
vi /usr/local/bin/yum-install

```

```sh
downloaddir=$( echo $* | awk '{for(i=1;i<=NF;i++) if($i~/--downloaddir/) print $i}' | cut -c 15- )
if [ -n == $downloaddir ];then
  echo "缺少 --downloaddir 参数"
  exit
fi
# 备份
backup="/etc/yum.conf.backup_$(date +%s)"
cp /etc/yum.conf $backup
# 设置不删除rpm包
sudo sed -i 's/keepcache=0/keepcache=1/' /etc/yum.conf
# 安装
yum install $*
# 记录命令
record=${downloaddir}/"how-to-get-rpm-files-on-this-dir.sh"
echo "# $(date +%y年%m月%d日)" > $record
echo "yum install $*" >> $record
# 恢复
rm -f /etc/yum.conf && mv $backup /etc/yum.conf


```

## yum-update

获取：

```sh
rm -rf /var/cache/yum/*
yum update -y --downloadonly
tar -zcvf update.tar.gz  /var/cache/yum/

```

安装

```sh
wget http://localcache/yum/update.tar
rm -rf /var/cache/yum/*
tar -zxvf update.tar.gz 
mv var/cache/yum/x86_64/ /var/cache/yum/
yum update

```



# 参考

 [yum保存要安装的rpm包及其依赖包.html](assets\references\yum保存要安装的rpm包及其依赖包.html) 
