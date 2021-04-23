output "instance_ip_public" {
  value = aws_instance.web-server.public_ip
  description = "Địa chỉ IP public của instance"
}

#ssh -i "ssh_key.pem" centos@<ip_address>
#scp -i "ssh_key.pem" centos@<>:~/home/