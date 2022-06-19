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

https://archive.apache.org/dist/maven/maven-3/

# Windows

| 动作 | key        | value                               |
| ---- | ---------- | ----------------------------------- |
| 新建 | MAVEN_HOME | C:\cache\MyMaven\apache-maven-3.6.3 |
| 编辑 | Path       | %MAVEN_HOME%\bin                    |

```
mvn -v
```

# Linux

```
wget https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

tar -zxvf apache-maven-3.6.3-bin.tar.gz

mv apache-maven-3.6.3 /usr/local/maven-3.6.3


echo "MAVEN_HOME=/usr/local/maven-3.6.3" >> /etc/profile
echo "PATH=\$PATH:\$MAVEN_HOME/bin" >> /etc/profile

 
source /etc/profile
 
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

