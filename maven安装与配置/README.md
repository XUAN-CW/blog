---
title: maven安装与配置
date: 2020-04-05 14:32:15
tags:
- maven
- 配置
- win10
- reinstall
---

# maven版本

[apache-maven-3.6.3-bin](https://maven.apache.org/)

# Windows

| 动作 | key        | value                               |
| ---- | ---------- | ----------------------------------- |
| 新建 | MAVEN_HOME | C:\cache\MyMaven\apache-maven-3.6.3 |
| 编辑 | Path       | %MAVEN_HOME%\bin                    |

```
mvn -v
```



# setting.xml



```xml
  <mirrors>     
    <mirror>  
        <id>nexus</id>  
        <name>maven-private-server</name>  
        <url>http://ps:7000/repository/maven-private-server/</url>  
        <mirrorOf>central</mirrorOf>  
    </mirror>   
```

```
  <localRepository>../../maven_repository</localRepository>

```

