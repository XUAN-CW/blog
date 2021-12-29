---
title: Linux下安装nodejs
tags: 
- nodejs
- Linux
- 安装
date: 2021-12-30 01:56:23
id: 1640800583510862100
---
# 概述

# 环境

- Ubuntu 18.04.5 LTS

# 版本选择

- node-v16.13.1-linux-x64.tar.xz |  [下载页面](https://nodejs.org/dist/v16.13.1/) | [下载链接](https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz) 

这里选择已经编译好文件版本。简单说就是解压后，在bin文件夹中已经存在node以及npm，如果你进入到对应文件的中执行命令行一点问题都没有，不过不是全局的，所以通过建立软链接的方式将这个设置为全局就好了

# 安装过程

```sh
# 下载
wget https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz
# 解压
tar xf node-v16.13.1-linux-x64.tar.xz -C /usr/local/
# 创建软连接
ln -s /usr/local/node-v16.13.1-linux-x64/bin/node /usr/local/bin
ln -s /usr/local/node-v16.13.1-linux-x64/bin/npm /usr/local/bin
```

# 参考

 [Linux下Nodejs安装.html](assets\references\Linux下Nodejs安装.html) 



















