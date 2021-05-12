# khoaluan
# 
# Lưu file ssh_key.pem tại thư mục này
# 
# Khi chạy terraform apply --auto-approve tại thư mục này:
# File ../ansible-main/AWS_hosts được tạo chứa thông tin instance
# File ./AWS_easy_access.txt được tạo chứa lệnh ssh với ip instance vừa tạo
# Instance vừa tạo chạy script install_docker.sh sau khi khởi động
# Tự động cài đặt docker + docker-compose
# Copy ../docker từ local tới remote instance
#
# C:\Windows\System32\drivers\etc\hosts
