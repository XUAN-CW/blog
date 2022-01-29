---
title: springboot-initializr私服
tags: 
- springboot
- initializr
- 私服
date: 2021-12-24 00:09:24
id: 1640275764181110200
---

# 摘要

云服务器搭建 springboot Initializr 私服，这里我们不需要 web 界面，就单纯给 IDEA 用

# 私服搭建

## clone

```sh
git clone https://github.com/spring-io/start.spring.io.git
```

## 删除 start-client

start-client 需要 nodejs 打包，相当麻烦，这里我们删掉它，需要 web 界面的别删

![image-20220129012608749](assets/images/image-20220129012608749.png)

## package

```
mvn clean package -Dmaven.test.skip=true 
```

打完包之后其实就可以用了，在 target 目录下运行 `java -jar start-site-exec.jar` 运行测试一下，是没有问题的。下面是发布到服务器上的步骤

## Docker 部署

将 start-site-exec.jar 上传到服务器后在通一目录下创建 Dockerfile ，内容如下：

```dockerfile
# FROM java:8
FROM openjdk:8-jdk-alpine
# 测试时用这个，工具比较多
# FROM openjdk:8u312-oraclelinux8
COPY start-site-exec.jar app.jar
# 这个地方要与配置文件中的 server.port 一致
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
```

然后创建镜像：

```sh
docker image build -t springboot-initializr:1.0 -f Dockerfile .
```

最后运行：

```sh
docker run -itd -p 9000:8080 springboot-initializr:1.0
```

# IDEA 中配置

在 Server URL 中输入私服地址即可

![image-20220129111741503](assets/images/image-20220129111741503.png)

