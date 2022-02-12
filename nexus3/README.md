---
title: nexus3
tags: 
date: 2022-02-12 18:31:11
id: 1644661871858288100
---
# 摘要



# 运行

```sh
rm -rf /docker-v/necus3/ && mkdir -p /docker-v/necus3/
chmod 777 -R /docker-v/necus3/
docker run -itd  -p 8081:8081 -p 8083:8083 -v /docker-v/necus3/nexus-data:/nexus-data --privileged=true --restart=always --name=nexus3 sonatype/nexus3:3.2.1
```

# 访问

- 路径： http://nexus3-ip:8081/
- 账号：admin
- 密码：admin123

# Create repository

![image-20220212203136223](assets/images/image-20220212203136223.png)

# 测试

## 加入授信列表

别忘了修改 **nexus3-ip** 为自己的 IP

```sh
tee /etc/docker/daemon.json <<-'EOF'
{
  "insecure-registries": ["nexus3-ip:8081"]
}
EOF

# 重启
systemctl daemon-reload
systemctl restart docker
```

## 登录

```sh
docker login -u admin -p admin123 nexus3-ip:8083
```

## push 

- push 前记得登录
- 别忘了修改 **nexus3-ip** 为自己的 IP

```sh
docker pull hello-world
docker tag hello-world:latest nexus3-ip:8083/my-hello-world:1.0
docker push nexus3-ip:8083/my-hello-world:1.0
```























