---
title: Windows重装
date: 2021-12-19 22:37:21
tags: 
categories: 
id: 1639924641941536800
---

# 此电脑

显示此电脑图标：

右键桌面→个性化→主题→相关设置→桌面图标设置→计算机

# C盘

隐藏多余目录

# 任务栏

右键任务栏→任务栏设置

1. 搜索：仅“搜索”图标
2. 任务视图：关
3. 小组件：关
4. 其他系统托盘图标: Microsoft OneDrive 关
5. 任务栏行为→任务栏对齐方式：靠左

# 开始菜单

个性化→开始

布局：更多固定项目

显示最近添加的应用：关闭

关闭 Web 搜索

1. 在开始菜单图标上右键选择 “运行”，键入 regedit.exe 打开注册表编辑器。
2. 在注册表编辑器内访问：计算机\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search
3. 在 Search 上右键，选择 “新建”>“Dword（32 位）值”，将值命名为 BingSearchEnabled。
4. 双击 BingSearchEnabled，并将数据设置为 0。

## Win11取消 推荐 的项目方法

1. 首先点击下方的开始菜单，选择“设置”，打开设置界面。
2. 然后会进入个性化界面，点击“开始”选项。
3. 进入开始界面后，关闭“显示最近添加的应用”选项后面的开关。
4. 将“显示最近添加的应用”关闭后设置即可完成。
5. 最后再次打开开始菜单，就可以发现“**推荐**的项目”已经关闭了。

# 恢复备份

# 清理任务栏

深层次清理可右键任务栏→任务栏设置→通知区域→选择哪些图标显示在任务栏上/打开或关闭系统图标

# 安装软件

# 所有程序管理员运行

 [所有程序默认为以管理员身份运行.reg](assets\reg\所有程序默认为以管理员身份运行.reg) 

 [所有程序默认为以管理员身份运行_恢复默认.reg](assets\reg\所有程序默认为以管理员身份运行_恢复默认.reg) 

# 固定到开始屏幕

# 固定到任务栏

# 任务管理器

 [视频_恢复默认.reg](assets\reg\视频_恢复默认.reg)  [视频_移除.reg](assets\reg\视频_移除.reg) 

 [图片_恢复默认.reg](assets\reg\图片_恢复默认.reg)  [图片_移除.reg](assets\reg\图片_移除.reg) 

 [文档_恢复默认.reg](assets\reg\文档_恢复默认.reg)  [文档_移除.reg](assets\reg\文档_移除.reg) 

 [下载_恢复默认.reg](assets\reg\下载_恢复默认.reg)  [下载_移除.reg](assets\reg\下载_移除.reg) 

 [音乐_恢复默认.reg](assets\reg\音乐_恢复默认.reg)  [音乐_移除.reg](assets\reg\音乐_移除.reg) 

 [桌面_恢复默认.reg](assets\reg\桌面_恢复默认.reg)  [桌面_移除.reg](assets\reg\桌面_移除.reg) 

 [3D对象_恢复默认.reg](assets\reg\3D对象_恢复默认.reg)  [3D对象_移除.reg](assets\reg\3D对象_移除.reg) 

 [快捷方式_恢复默认.reg](assets\reg\快捷方式_恢复默认.reg)  [快捷方式_移除后缀.reg](assets\reg\快捷方式_移除后缀.reg) 

 [快速访问_恢复默认.reg](assets\reg\快速访问_恢复默认.reg)  [快速访问_移除.reg](assets\reg\快速访问_移除.reg) 



# 软件

1. jdk 
2. maven 
3. nodejs
4. [2022.3.3 - Windows x64 (exe)](https://download.jetbrains.com/idea/ideaIU-2022.3.3.exe?_gl=1*vxsc9u*_ga*MzE3OTU4NjQ4LjE3MDMyNjk2ODU.*_ga_9J976DJZ68*MTcwMzI2OTY4NS4xLjEuMTcwMzI2OTc3Mi42MC4wLjA.&_ga=2.164267132.256923718.1703269686-317958648.1703269685)
5. firefox 
6. Bandizip
7. RegexBuddy 4
8. Typora
9. [I'm QQ - 每一天，乐在沟通](https://im.qq.com/download/)
10. [Firefox 火狐浏览器 - 全新、安全、快速 | 官方最新下载](https://www.firefox.com.cn/)
11. [Chrome](https://www.google.com/chrome/) 
12. [下载 Android Studio Giraffe | 2022.3.1 Patch 3 适用平台： Windows ](https://redirector.gvt1.com/edgedl/android/studio/install/2022.3.1.21/android-studio-2022.3.1.21-windows.exe)
13. Notepad3 
14. DBeaver 
15. Git
16. Honeyview
17. VirtualBox
18. PotPlayer
19. QNAP
20. GitHub Desktop
21. Steam
22. 网易有道翻译
23. everything
24. 115浏览器
25. 百度网盘
26. postman
27. SumatraPDF
28. vscode















