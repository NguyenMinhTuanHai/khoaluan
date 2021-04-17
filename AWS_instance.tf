resource "aws_instance" "web-server" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = var.ec2-key
  vpc_security_group_ids = [aws_security_group.allow_all_ssh_http_https.id] 
  

  // tạo file inventory với thông tin máy ảo sẵn sàng
  provisioner "local-exec" {
    command = "echo ansible_client: > ansible/inventory.yml"
  }
  
  provisioner "local-exec" {
    command = "echo '  hosts:' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '    ${aws_instance.web-server.public_ip}' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '  vars:' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '    domain: helloworld.com' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '    ansible_user: centos' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '    ansible_ssh_private_key_file: ssh_key.pem' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '    # ansible_sudo_pass: qwerty' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '# Kiem tra ket noi bang lenh:' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '# ansible ansible_client -i ansible/inventory.yml -m ping' >> ansible/inventory.yml"
  }
  
  provisioner "local-exec" {
    command = "echo '# Cai dat su dung playbook' >> ansible/inventory.yml"
  }
  
  provisioner "local-exec" {
    command = "echo '# ansible-playbook ansible/inventory.yml -i ansible/inventory.yml -v' >> ansible/inventory.yml"
  }

  provisioner "local-exec" {
    command = "echo '# Lenh ssh vao Instance' >> ansible/inventory.yml"
  }
  
  provisioner "local-exec" {
    command = "echo '# ssh -i ssh_key.pem centos@${aws_instance.web-server.public_ip} ' >> ansible/inventory.yml"
  }

  // Tạo thư mục lưu file trong wordpress-source
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

  // Copy tất cả file trong thư mục wordpress-source đến /home/centos/wordpress-source-remote/
  /*provisioner "file" {
    source      = "wordpress-source/"
    destination = "~/wordpress-source-remote/"    /* ~/ = /home/centos 
    
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