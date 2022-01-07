---
title: vagrant的使用
tags: 
- ubuntu
- vagrant
- virtualbox
- 导出
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

# 修改配置

编辑 **Vagrantfile** 后使用 `vagrant reload` 才能生效

# 自定义虚拟机的导出与导入

## 导出

### 查找要导出的虚拟机

1. 找到 VirtualBox 的安装位置，我的 VirtualBox 安装在 [C:\Program Files\Oracle\VirtualBox](C:\Program Files\Oracle\VirtualBox) 
2. cmd 进入 VirtualBox 的安装位置，我这里是  [C:\Program Files\Oracle\VirtualBox](C:\Program Files\Oracle\VirtualBox) 
3. 列表展示已经安装的虚拟机

```
C:\Program Files\Oracle\VirtualBox>vboxmanage list vms
"ubuntu18-default_default_1640180873578_92882" {71dea74c-5ca8-4592-bac4-401bb6dfa5d1}
"breezewin10-edge_default_1640510960981_76647" {7e8b01d8-b0ff-4cb9-8d75-5c1e780fc152}
"k8s-master_default_1641209965459_75982" {bd71013d-9f52-4313-94a0-b87bf06eb55b}
"k8s-node1_default_1641214667453_95654" {82267e7a-ef20-449a-aa0b-bff005ae5c24}
"k8s-node2_default_1641214679386_32935" {89122452-885a-4083-a48f-46fcfca4823b}
```

### 上传公钥

如果不执行这一步，导入后启动会出现 ssh 登录失败。密钥对自行创建，创建好后上传公钥到虚拟机的 **~/.ssh/authorized_keys** 

###  [package-name】(https://www.vagrantup.com/docs/cli/package)  

如果我想导出 `ubuntu18-default_default_1640180873578_92882` 为 `package-name` 那么：

```
vagrant package --base ubuntu18-default_default_1640180873578_92882 --output package-name
```

## 导入















 [Vagrant之工作环境的迁移.html](assets\references\Vagrant之工作环境的迁移.html) 

下面是我的一些配置：

```
Vagrant.configure("2") do |config|
  # ip 地址
  config.vm.network "private_network", ip: "192.168.18.10"
  config.vm.provider "virtualbox" do |vb|
    # 8G 内存
    vb.memory = "8192"
    # 2 核 CPU
    vb.cpus = 2
  end
 
end
```



