output "instance_ips" {
  value = aws_instance.web-server.public_ip
}

#ssh -i "ssh_key.pem" centos@<ip_address>
#scp -i "ssh_key.pem" centos@<>:~/home/