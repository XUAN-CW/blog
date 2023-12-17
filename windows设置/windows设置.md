---
title: windows设置
tags: 
date: 2023-12-17 02:13:08
id: 1702750388114031600
---
# 摘要







# 环回地址

![image-20231217024018805](assets/images/image-20231217024018805.png)

| 属性     | 值              |
| -------- | --------------- |
| IP 地址  | 192.168.18.10   |
| 子网掩码 | 255.255.255.0   |
| 网关     | 192.168.18.1    |
| 首先DNS  | 8.8.8.8         |
| 备选DNS  | 114.114.114.114 |







 [Windows11添加虚拟环回网卡.html](assets\references\Windows11添加虚拟环回网卡.html) 









# WSL2



```
sudo docker run -d -p 80:80 --restart=always nginx:1.25
```











## 固定IP

### SwitchType External

管理员运行 PowerShell

```
PS C:\Users\XUAN>
PS C:\Users\XUAN> Get-VMSwitch -SwitchType External

Name         SwitchType NetAdapterInterfaceDescription
----         ---------- ------------------------------
WSL2_network External   Realtek 8821CE Wireless LAN 802.11ac PCI-E NIC


PS C:\Users\XUAN>
```























