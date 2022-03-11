---
title: springboot 整合 docker 
tags:
- springboot
- docker
---

# 创建项目

一个最简单的 HelloWorld 项目打包  [code-1.0-SNAPSHOT.jar](data\code\target\code-1.0-SNAPSHOT.jar) 



#  [Dockerfile](..\..\Dockerfile) 

需要修改第四行 `ADD code-1.0-SNAPSHOT.jar app.jar` 

```dockerfile
FROM java:8
VOLUME /tmp 
# 将jar包添加到容器中并更名为app.jar
ADD code-1.0-SNAPSHOT.jar app.jar 
# 运行jar包
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

```

# build

`exam` 是你的镜像名，就像 redis 一样

```sh
docker build -t exam .
```

# run

运行 `exam` 内部 `8080` 映射到 `8081` 

```sh
docker  run --name exam-8081 -p 8081:8080 exam
```

# 访问

http://47.102.200.197:8081/hello





















