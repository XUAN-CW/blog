---
title: Ubuntu18安装
tags: 
date: 2022-02-12 16:38:40
id: 1644655120462713900
---
# 摘要



# 重点

1. 制作镜像
2. 进入BIOS，设置 Secure Boot `Disable` 
3.    保证新装的系统可以联网，可是使用 USB 将电脑与联网的手机连接，再开启 **USB共享网络** ，就可以上网了
4. 打开 **软件与更新** 面板，添加附加驱动
5. 设置静态地址

# 提示

## 设置静态地址

Wi-Fi → 连接的Wi-Fi → 设置 → IPv4

设置完毕后重新连接即可

## ssh 连接

```sh
sudo apt-get install openssh-server -y
```



## 合盖不休眠

```sh
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```



# 参考

 [Ubuntu 18.04未发现WiFi适配器解决办法.html](assets\references\Ubuntu 18.04未发现WiFi适配器解决办法.html) 

 [Ubuntu18.04_20.04完整新手安装教程.html](assets\references\Ubuntu18.04_20.04完整新手安装教程.html) 

 [ubuntu18.04系统安装完之后显示未发现WiFi适配器.html](assets\references\ubuntu18.04系统安装完之后显示未发现WiFi适配器.html) 

 [安装Ubuntu系统后无法链接WiFi（未发现WiFi适配器）的解决办法.html](assets\references\安装Ubuntu系统后无法链接WiFi（未发现WiFi适配器）的解决办法.html) 



