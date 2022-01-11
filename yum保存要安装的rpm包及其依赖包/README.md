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

# my-yum

```sh
# 备份
backup="/etc/yum.conf.backup_$(date +%s)"
cp /etc/yum.conf $backup
# 设置不删除rpm包
sudo sed -i 's/keepcache=0/keepcache=1/' /etc/yum.conf
# 默认缓存目录
cachedir="/var/cache/yum/"
# 清空默认缓存目录
rm -rf ${cachedir}*
# 安装
yum $* -y
# 记录命令
record=${cachedir}/"how-to-get-rpm-files-on-this-dir.sh"
echo "# $(date +%y年%m月%d日)" > $record
echo "yum $* -y" >> $record
chmod 777 ${record}
# 打包,打包之后记得重命名
tar -zcvf yum-cache.tar.gz  /var/cache/yum/
# 恢复设置
rm -f /etc/yum.conf && mv $backup /etc/yum.conf


```

# my-yum-install 

```sh
url=$1
cachedir="/var/cache/yum/"
record=${cachedir}/"how-to-get-rpm-files-on-this-dir.sh"
curl $url -o yum-package.tar.gz 
rm -rf /var/cache/yum/
tar -zxvf yum-package.tar.gz 
mv var/cache/yum/ /var/cache/
bash ${record}

```



# 参考

 [yum保存要安装的rpm包及其依赖包.html](assets\references\yum保存要安装的rpm包及其依赖包.html) 
