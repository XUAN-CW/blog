############################## root ##############################
# 1、设置 root 用户
echo -e "rootroot\nrootroot" | sudo passwd root
# 2、允许使用 root 登录
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# 3、使用密码登录 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# 4、刷新
sudo systemctl restart sshd
# 5、切换 root 用户
echo -e "rootroot" | su root
# 6、删除多余
##cd && rm -f anaconda-ks.cfg original-ks.cfg

########################### 本地服务器 ############################
# 配置本地服务器 
echo "192.168.20.10 localserver" >> /etc/hosts
echo "192.168.20.10 nexus3.localserver" >> /etc/hosts
echo "192.168.20.10 apt.localserver" >> /etc/hosts
echo "192.168.20.10 hosted.docker.localserver" >> /etc/hosts
echo "192.168.20.10 mirror.docker.localserver" >> /etc/hosts
echo "192.168.20.10 maven.localserver" >> /etc/hosts
echo "192.168.20.10 npm.localserver" >> /etc/hosts
echo "192.168.20.10 pypi.localserver" >> /etc/hosts
echo "192.168.20.10 yum.localserver" >> /etc/hosts
############################## yum ##############################

# yum 配置不删除缓存
sudo sed -i 's/keepcache=0/keepcache=1/' /etc/yum.conf


# yum源优先级插件
sudo yum install yum-plugin-priorities -y

# 更新
sudo yum update -y
# 安装常用工具
sudo yum install zip -y
sudo yum install -y unzip
sudo yum install net-tools -y
sudo yum install wget -y
sudo yum install jq -y
############################## 校准时间 ##############################
# 1、查看时间时区
date
# 2、修改时区
sudo timedatectl set-timezone Asia/Shanghai # 设置系统时区为上海
# 3、安装ntp 联网校准时间
sudo yum install ntp -y
# 4、联网（阿里时间服务器）校准时间
sudo ntpdate ntp1.aliyun.com
############################## docker ##############################
# 添加 docker 源，三选一即可
## docker 官方源地址（比较慢）
#sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
## docker阿里云源地址
#sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# docker清华大学源地址
sudo yum-config-manager --add-repo https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/docker-ce.repo
# 安装指定版本 docker
sudo yum install -y docker-ce-20.10.7 docker-ce-cli-20.10.7  containerd.io-1.4.6

# 启动 docker
sudo systemctl start docker
sudo systemctl enable docker
# docker主机开启docker 远程访问API
#     访问 http://ip:2375/images/json 查看是否成功
sudo sed -i "s|ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock|ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock|g" /lib/systemd/system/docker.service 
sudo systemctl daemon-reload
sudo systemctl restart docker
# docker-compose
sudo chmod 777 -R /usr/local/bin/


