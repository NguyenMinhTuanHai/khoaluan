resource "aws_instance" "web-server" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = var.ec2-key
  vpc_security_group_ids = [aws_security_group.allow_all_ssh_http_https.id]

  provisioner "local-exec" {
    command = "ssh-keyscan -H ${aws_instance.web-server.public_ip} >> ~/.ssh/known_hosts"
  }

  provisioner "local-exec" {
    command = "scp -i ssh_key.pem -r wordpress-source centos@${aws_instance.web-server.public_ip}:~"
  }

  /*provisioner "file" {
    source      = "wordpress-source/*"
    destination = "~/home/centos/"
    
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = "$file(ssh_key.pem)"
      host        = "${aws_instance.web-server.public_ip}"
  }
  }*/

  tags = {
    Name = "terraform-web-server"
  }
}