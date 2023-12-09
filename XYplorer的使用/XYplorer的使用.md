---
title: XYplorer的使用
tags: 
date: 2023-01-01 16:53:40
id: 1672563220496415700
---
# 摘要





https://violet7pan.gitee.io/categories/XYplorer/

https://github.com/violet7pan/XYplorer_Help





# 布局



## 地址栏和工具栏堆叠

![image-20231209054924689](assets/images/image-20231209054924689.png)







# 显示列-显示标签

![image-20231209051232653](assets/images/image-20231209051232653.png)













# 整行选择

![image-20231209051420430](assets/images/image-20231209051420430.png)



# 自定义工具栏

## 打开自定义工具栏

![image-20231209052724917](assets/images/image-20231209052724917.png)



## 常用工具

![image-20231209133722516](assets/images/image-20231209133722516.png)



## 自定义工具-添加按钮

![image-20231209053422300](assets/images/image-20231209053422300.png)

### 编辑按钮

右键编辑

![image-20231209053521191](assets/images/image-20231209053521191.png)

#### 填写点击效果

![image-20231209053624559](assets/images/image-20231209053624559.png)



```
正则表达式重命名
C:\core\blog\图标\正则式.ico
# 122
```





#### 运行脚本

```
run("C:\Users\33719\Desktop\test.sh");
```



#### 获取命令ID

![image-20230819195422368](assets/images/image-20230819195422368.png)



### 正则表达式重命名

```
正则表达式重命名
C:\core\blog\图标\正则式.ico
# 122
```

### 常用路径

```
core
C:\core\index.ico
tab("new","C:\core");# 352;
```

```
java
C:\core\java\index.ico
tab("new","C:\core\java");# 352;
```

```
vm
C:\core\blog\图标\virtualBox.ico
tab("new","C:\vm");# 352;
```









# 标签页设置

## 路径图表化、锁定位置

![image-20231209060444538](assets/images/image-20231209060444538.png)

























![image-20231209061633489](assets/images/image-20231209061633489.png)





## 双击标签页切换锁定状态

![image-20231209062116928](assets/images/image-20231209062116928.png)



# 设置缩略图大小

![image-20231209140233441](assets/images/image-20231209140233441.png)



编辑配置文件

![image-20231209140316155](assets/images/image-20231209140316155.png)

设置宽度，记得先关闭 xyplorer 后修改

```
[Thumbs]
; Tweak: comma-separated list of values used for width and height in pixels
ThumbSizes=16,32,64,96,128,192,200,300,400,600,800,1200,1600
Width=192
Height=108
```

