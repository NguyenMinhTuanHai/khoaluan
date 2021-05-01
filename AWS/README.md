# khoaluan
# Lưu file ssh_key.pem tại thư mục này

# 1 số câu lệnh cần thiết
# scp -r -i ssh_key.pem ../with-cert centos@13.212.234.111:~
# scp -r -i ssh_key.pem ../with-cert ubuntu@13.212.248.249:~
# 
# systemctl start mariadb
# mysql_secure_installation
# sudo passwd root
# systemctl status nginx
# sudo yum install firewalld
# sudo systemctl unmask firewalld
# sudo systemctl enable firewalld
# sudo systemctl start firewalld
# sudo systemctl status firewalld
# sudo systemctl enable firewalld
# sudo systemctl start firewalld
# sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
# sudo firewall-cmd --reload
# sudo systemctl restart nginx mariadb php-fpm
# 
# sudo vi /etc/ssh/sshd_config
# sudo su - root
# PermitRootLogin without-password
# sudo cp /home/centos/.ssh/authorized_keys /root/.ssh
# 
# sudo vi /etc/selinux/config
# selinux = disabled
# sudo reboot
# 
# C:\Windows\System32\drivers\etc\hosts