---
title: windows11_WSL2
tags: 
date: 2023-12-07 22:03:40
id: 1701957820709315200
---
# 摘要





# 安装



# 参考





 [WSL2 的 2.0 更新彻底解决网络问题.html](assets\references\WSL2 的 2.0 更新彻底解决网络问题.html) 

 [文件夹下右键在终端打开，希望从当前目录下打开wsl.html](assets\references\文件夹下右键在终端打开，希望从当前目录下打开wsl.html) 

# 设置

## 在终端中打开

 [文件夹下右键在终端打开，希望从当前目录下打开wsl.html](assets\references\文件夹下右键在终端打开，希望从当前目录下打开wsl.html) 







## 固定IP

```sh
sudo vi /etc/netplan/00-wsl2-dhcp.yaml
```



```yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: false
      addresses: [192.168.18.10/24]
      routes:
        - to: 0.0.0.0/0
          via: 192.168.18.1  # Replace with your actual gateway address
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]  # Replace with your DNS server addresses

```

```sh
sudo netplan apply
```



```
wsl -d Ubuntu hostname -I
```







```sh
ip addr show
```



## (暂时无用)启用或关闭Windows功能

控制面板 -> 程序和功能 -> 启用或关闭Windows功能

![image-20231207223827828](assets/images/image-20231207223827828.png)



## (暂时无用)Hyper-V

![image-20231207224338205](assets/images/image-20231207224338205.png)









# curl

```
curl http://localhost:8080
curl http://192.168.18.10:8080

```





