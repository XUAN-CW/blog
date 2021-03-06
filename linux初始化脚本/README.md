---
title: linux初始化脚本
tags: 
- linux
- centOS
- Ubuntu
- Ubuntu18
- docker
date: 2021-12-30 20:01:59
id: 1640865719620490200
---
# 概述

# ubuntu-18初始化脚本

```sh
# 1 设置 root 用户
echo -e "root\nroot" | sudo passwd root
# 2 允许使用 root 登录
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# 3 使用密码登录 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# 刷新
sudo systemctl restart sshd
# 清理垃圾
rm -rf ~/*

```

```sh
# 安装常用工具
sudo apt-get update -y
sudo apt-get install zip -y
sudo apt-get install net-tools -y
sudo apt-get install wget -y

```

```markdown
本人自定义的脚本
  1. docker-save
  2. docker-load
  3. yum-install
```

```sh

# 1 docker 安装
# 参考 https://www.runoob.com/docker/ubuntu-docker-install.html
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
sudo systemctl start docker
sudo systemctl enable docker
# 2 加速
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://6ypv0a1a.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
# 3 docker主机开启docker 远程访问API
#     访问 http://ip:2375/images/json 查看是否成功
sudo sed -i "s|ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock|ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock|g" /lib/systemd/system/docker.service 
sudo systemctl daemon-reload
sudo systemctl restart docker
# 4 docker-compose 安装
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

```

# centOS-7.8 初始化脚本

```sh
# 1 设置 root 用户
echo -e "root\nroot" | sudo passwd root
# 2 允许使用 root 登录
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# 3 使用密码登录 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# 刷新
sudo systemctl restart sshd
# 清理垃圾
rm -rf ~/*

```

```sh
# 安装常用工具
sudo yum update -y
sudo yum install zip -y
sudo yum install net-tools -y
sudo yum install wget -y

```

```markdown
本人自定义的脚本
  1. docker-save
  2. docker-load
  3. yum-install
```

```sh
# 1 docker 安装
# 参考 https://www.runoob.com/docker/ubuntu-docker-install.html
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
sudo systemctl start docker
sudo systemctl enable docker
# 2 加速
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://6ypv0a1a.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
# 3 docker主机开启docker 远程访问API
#     访问 http://ip:2375/images/json 查看是否成功
sudo sed -i "s|ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock|ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock|g" /usr/lib/systemd/system/docker.service 
sudo systemctl daemon-reload
sudo systemctl restart docker
# 4 docker-compose 安装
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

```

