---
title: nexus3
tags: 
date: 2022-02-12 18:31:11
id: 1644661871858288100
---
# 摘要



```sh
docker run --rm  -p 8081:8081 -p 8083:8083 -v /docker-v/necus3/nexus-data:/nexus-data --privileged=true --name=nexus3 sonatype/nexus3:3.37.3
```



```sh
docker run -itd  -p 8081:8081 -p 8083:8083 -v /docker-v/necus3/nexus-data:/nexus-data --privileged=true --restart=always --name=nexus3 sonatype/nexus3:3.37.3
```



## 访问

- 路径： http://nexus3-ip:8081/
- 账号：admin
- 密码： **container** 内的 **/nexus-data/admin.password** 存放着密码

## 创建仓库

https://blog.yowko.com/nexus-docker-image-rergistry/

# 测试

```sh
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://zydiol88.mirror.aliyuncs.com"],
  "insecure-registries": ["192.168.0.10:8081","192.168.0.10:8083"]
}
EOF


# 重启
systemctl daemon-reload
systemctl restart docker
```





```sh
docker login -u admin  192.168.0.10:8083 -padmin
```

