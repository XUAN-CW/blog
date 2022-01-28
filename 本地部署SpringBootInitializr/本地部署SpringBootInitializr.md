---
title: 本地部署SpringBootInitializr
date: 2021-12-24 00:09:24
tags: 
categories: 
id: 1640275764181110200
---

# 方法一（推荐）

 [搭建自己的Spring Initializr.html](assets\references\搭建自己的Spring Initializr.html) 



```sh
git clone https://github.com/spring-io/start.spring.io.git
mvn clean package -Dmaven.test.skip=true 
```







# 方法二

## 启动

不废话，直接拿 [initializr-service-custom-0.9.0.zip](assets\data\initializr-service-custom-0.9.0.zip) 解压，得到 **initializr-service-custom-0.9.0.jar** ，然后运行即可

```sh
java -jar initializr-service-custom-0.9.0.jar
```



## 参考

 [本地部署SpringBootInitializr .html](assets\references\本地部署SpringBootInitializr .html) 

https://www.cnblogs.com/shishaolong/p/11757929.html 
