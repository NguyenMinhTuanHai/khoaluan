resource "aws_instance" "web-server" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = var.ec2-key
  vpc_security_group_ids = [aws_security_group.allow_all_ssh_http_https.id]



  #tạo file inventory với thông tin máy ảo sẵn sàng
  provisioner "local-exec" {
    command = "echo [ansible_client] > inventory"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.web-server.public_ip} ansible_ssh_user=centos ansible_ssh_private_key_file=ssh_key.pem >> inventory"
  }
  


  /*provisioner "local-exec" {
    command = "scp -i ssh_key.pem -r wordpress-source centos@${aws_instance.web-server.public_ip}:~"
  }*/



  # Tạo thư mục lưu file trong wordpress-source
  /*provisioner "remote-exec" {
    inline = [
      "mkdir ~/wordpress-source-remote/",
    ]

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file(var.ssh_key)
      host        = aws_instance.web-server.public_ip
    }
  }*/

  # Copy tất cả file trong thư mục wordpress-source đến /home/centos/wordpress-source-remote/
  /*provisioner "file" {
    source      = "wordpress-source/"
    destination = "~/wordpress-source-remote/"    /* ~/ = /home/centos */
    
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file(var.ssh_key)
      host        = aws_instance.web-server.public_ip
    }
  }*/

  tags = {
    Name = "terraform-web-server"
  }
}