resource "aws_instance" "web-server" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = var.ec2-key
  vpc_security_group_ids = [aws_security_group.allow_all_ssh_http_https.id] 
  

  // tạo file inventory với thông tin máy ảo sẵn sàng
  provisioner "local-exec" {
    command = "echo [webserver] > ../ansible-main/hosts"
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "echo server1 ansible_host=${aws_instance.web-server.public_ip} ansible_user=centos ansible_ssh_private_key_file=../AWS/ssh_key.pem >> ../ansible-main/hosts"
    on_failure = continue
  }

  // Tao file easy_access.txt

  provisioner "local-exec" {
    command = "echo '# Lenh ssh vao Instance' > easy_access.txt"
    on_failure = continue
  }
  
  provisioner "local-exec" {
    command = "echo '# ssh -i ssh_key.pem centos@${aws_instance.web-server.public_ip} ' >> easy_access.txt"
    on_failure = continue
  }

  // Tạo thư mục lưu file trong with-cert
  # provisioner "remote-exec" {
  #   inline = [
  #     "mkdir ~/wordpress-source-remote/",
  #   ]

  #   connection {
  #     type        = "ssh"
  #     user        = "centos"
  #     private_key = file(var.ssh_key)
  #     host        = aws_instance.web-server.public_ip
  #   }
  # }

  // Copy tất cả file trong thư mục with-cert đến /home/centos/with-cert/
  provisioner "file" {
    source      = "../with-cert"
    destination = "~/"    // ~/ = /home/centos 
    
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file(var.ssh_key)
      host        = aws_instance.web-server.public_ip
    }
  }

  provisioner "file" {
    source      = "./install_docker.sh"
    destination = "~/install_docker.sh"    // ~/ = /home/centos 
    
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file(var.ssh_key)
      host        = aws_instance.web-server.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "cd",
      "echo 'IP Address: ${aws_instance.web-server.private_ip} install docker'",
      "bash install_docker.sh",
    ]

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file(var.ssh_key)
      host        = aws_instance.web-server.public_ip
    }
  }

  tags = {
    Name = "terraform-web-server"
  }
  
}