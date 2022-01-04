---
title: yum保存要安装的rpm包及其依赖包
tags: 
- yum 
- 离线
date: 2022-01-04 18:00:43
id: 1641290443790725200
---
# 概述

```sh
# yum自动下载 vim RPM 包及其所有依赖的包至 /rpm/vim 目录：
yum install --downloadonly --downloaddir=/rpm/vim vim
# 切换到下载目录中批量安装 vim
cd /rpm/vim
rpm -ivh * 
```



# 参考

 [yum保存要安装的rpm包及其依赖包.html](assets\references\yum保存要安装的rpm包及其依赖包.html) 
