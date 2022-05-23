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
cd && rm -f anaconda-ks.cfg original-ks.cfg
############################## yum ##############################
# 更新
yum update -y
# 安装常用工具
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



