---
title: docker安装
date: 2021-08-18 22:28:00
tags: 
categories: 
id: 1629296880190252500
---

# centOS7.3 安装 docker

```
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

```
sudo yum install -y yum-utils
```

```
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

```
sudo yum install docker-ce docker-ce-cli containerd.io -y
```

## 启动

```
sudo systemctl start docker
```

## 版本查看

```
docker -v
```

## 开机自启动

```
sudo systemctl enable docker
```

## 加速

```sh
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://6ypv0a1a.mirror.aliyuncs.com","http://hub-mirror.c.163.com","https://registry.docker-cn.com","https://docker.mirrors.ustc.edu.cn"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```





# Ubuntu  安装 docker

[Ubuntu Docker 安装](https://www.runoob.com/docker/ubuntu-docker-install.html) 

[Docker Compose](https://www.runoob.com/docker/docker-compose.html)





















