---
title: jdk安装
date: 2021-10-26 10:13:37
tags: 
- java 
- jdk
categories: 
id: 1635214417153828400
---



# Windows

设置中搜索 **查看高级系统设置** 

| 动作 | key       | value                                       |
| ---- | --------- | ------------------------------------------- |
| 新建 | JAVA_HOME | C:\Program Files\Java\jdk-11.0.4            |
| 编辑 | Path      | %JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;        |
| 新建 | CLASSPATH | .;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar |

```
java -version
```

# Linux

```sh
#!/bin/bash

# 请将下载的jdk-xxx-linux-xxx.tar.gz包与此脚本放置到同一目录
# 授予此脚本可执行权限(chmod +x install_jdk.sh)

# 必须确保jvmpath路径不存在
jvmpath=/usr/lib/jvm/

# 不存在
if [ ! -d "$jvmpath" ]; then
    echo "正在创建$jvmpath目录"
    mkdir $jvmpath
    echo "目录$jvmpath创建成功"
fi

jdkfile=$(ls | grep jdk*linux*.tar.gz)

if [ -f "$jdkfile" ]; then

    tar -zxvf $jdkfile -C $jvmpath
    # 把解压的包的名称赋值给jdkdirname
    jdkdirname=$(ls $jvmpath) 

    echo "解压JDK成功"

    echo "配置环境变量"

    cp /etc/profile /etc/profile.bak
    echo "JAVA_HOME=$jvmpath/$jdkdirname" >> /etc/profile
    echo "JRE_HOME=\${JAVA_HOME}/jre" >> /etc/profile
    echo "CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib" >> /etc/profile
    echo "PATH=\$PATH:\${JAVA_HOME}/bin:\${JRE_HOME}/bin" >> /etc/profile
    
    source /etc/profile
    echo "配置环境成功"


    echo "测试是否安装成功"
    java -version

fi


source /etc/profile

```

1.请将下载的jdk-xxx-linux-xxx.tar.gz包与此脚本放置到同一目录

2.授予此脚本可执行权限(chmod +x install_jdk.sh)

3.以root用户运行

4.执行完之后重新加载下配置 `source /etc/profile` 

## 解决vi/vim中粘贴时行首出现很多缩进和空格的问题

解决办法：
1，在拷贝前输入:set paste (这样的话，vim就不会启动自动缩进，而只是纯拷贝粘贴）
2，拷贝完成之后，输入:set nopaste (关闭paste)
