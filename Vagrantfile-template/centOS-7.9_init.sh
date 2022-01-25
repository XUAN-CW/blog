############################## root ##############################
# 1 设置 root 用户
echo -e "root\nroot" | sudo passwd root
# 2 允许使用 root 登录
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# 3 使用密码登录 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# 4 刷新
sudo systemctl restart sshd
# 5 切换 root 用户
echo -e "root" | su root
# 6 删除多余
cd && rm -rf *
############################## yum ##############################
# yum 配置不删除缓存
sudo sed -i 's/keepcache=0/keepcache=1/' /etc/yum.conf
# 配置仓库
cat <<EOF | sudo tee /etc/yum.repos.d/my-yum-repo.repo
[my-yum-repo]
name=my-yum-repo
baseurl=http://192.168.20.10:100/yum/x86_64/7
gpgcheck=0
gpgkey=
EOF

# 更新
yum update -y
# 安装常用工具
sudo yum install -y createrepo
sudo yum install zip -y
sudo yum install net-tools -y
sudo yum install wget -y


############################## 校准时间 ##############################
# 1、查看时间时区
date
# 2、修改时区
timedatectl set-timezone Asia/Shanghai # 设置系统时区为上海
# 3、安装ntp 联网校准时间
yum install ntp -y
# 4、联网（阿里时间服务器）校准时间
ntpdate ntp1.aliyun.com
############################## docker ##############################
# 安装指定版本 docker 
sudo yum install -y docker-ce-20.10.7 docker-ce-cli-20.10.7  containerd.io-1.4.6
# 启动 docker
sudo systemctl start docker
sudo systemctl enable docker
# docker 加速
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://6ypv0a1a.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
# docker主机开启docker 远程访问API
#     访问 http://ip:2375/images/json 查看是否成功
sudo sed -i "s|ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock|ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock|g" /lib/systemd/system/docker.service 
sudo systemctl daemon-reload
sudo systemctl restart docker
# docker-compose
sudo curl -L "http://192.168.20.10:100/software-for-development/docker/docker-compose_version_1.29.2/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod 777 -R /usr/local/bin/
# docker load 别名
alias docker-load='ls *docker_image* | sed -r "s#(.*)#docker load -i \1#" | bash'



