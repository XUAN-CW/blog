---
title: vagrant的使用
tags: 
- ubuntu
- vagrant
- virtualbox
date: 2021-12-20 21:03:45
id: 1640005425026157100
---

# 环境

- Vagrant 2.2.16 
- VirtualBox 6.1.18 
- bionic-server-cloudimg-amd64-vagrant.box

# 安装虚拟机的方法

以安装 bionic-server 为例

## 下载

**bionic-server-cloudimg-amd64-vagrant.box** ： [直接下载](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/bionic/current/bionic-server-cloudimg-amd64-vagrant.box) | [下载页面](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/bionic/current/) 

## [box add](https://www.vagrantup.com/docs/cli/box#box-add) 

我把 **bionic-server-cloudimg-amd64-vagrant.box** 下载到了 **"D:\core\Desktop\bionic-server-cloudimg-amd64-vagrant.box"** 所以我这里是：

```
vagrant box add bionic-server-cloudimg-amd64-vagrant "D:\core\Desktop\bionic-server-cloudimg-amd64-vagrant.box"
```

使用 [box list](https://www.vagrantup.com/docs/cli/box#box-list) 后可见：

```
[D:\vm\ubuntu18.04-server-amd64]$ vagrant box list
bionic-server-cloudimg-amd64-vagrant (virtualbox, 0)

[D:\vm\ubuntu18.04-server-amd64]$ 

```

##  [init](https://www.vagrantup.com/docs/cli/init) 

随便找个空目录进行初始化，这里我的空目录是 **D:\vm\ubuntu18.04-server-amd64** 。`vagrant init` 后面的 box 名不要手打，要从上面 **vagrant box list** 复制，这样可以避免一些错误。我们这里选择 **bionic-server-cloudimg-amd64-vagrant** ：

```
[D:\vm\ubuntu18.04-server-amd64]$ vagrant init  bionic-server-cloudimg-amd64-vagrant
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.

[D:\vm\ubuntu18.04-server-amd64]$ 

```

## [up](https://www.vagrantup.com/docs/cli/up) 

在 `init` 的目录下，使用 `vagrant up` ：

```
[D:\vm\ubuntu18.04-server-amd64]$ vagrant up
```

## [ssh](https://www.vagrantup.com/docs/cli/ssh) 

在 `init` 的目录下，使用 `vagrant ssh` ，即可登录虚拟机：

```
[D:\vm\ubuntu18.04-server-amd64]$ vagrant ssh
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-142-generic x86_64)
... ...
```

# 导出自定义虚拟机

 [Vagrant之工作环境的迁移.html](assets\references\Vagrant之工作环境的迁移.html) 

下面是我的一些配置：

```
Vagrant.configure("2") do |config|
  
  config.vm.box = "bionic-server-cloudimg-amd64-vagrant"

  config.vm.network "private_network", ip: "192.168.18.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
  end
  
end
```



