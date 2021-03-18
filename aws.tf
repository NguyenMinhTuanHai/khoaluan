//code này tạo dược máy ảo oke
provider "aws" {
  profile    = "default"
  region     = "ap-southeast-1" //khu vuc singapore
}

variable "ec2-key" {
  default = "ssh_key"
}

variable "ami" {
  default = "ami-0328671e8c353bc9c"
}

resource "aws_vpc" "hai-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "hai-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.hai-vpc.id

  tags = {
    Name = "terraform-IGW"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.hai-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private-subnet-10.0.1.0/24"
  }
}


resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.hai-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public-subnet-10.0.2.0/24"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.hai-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "private-subnet-10.0.1.0/24"
  }
}

resource "aws_security_group" "allow_all_ssh_http_https" {
  name        = "allow_all_ssh"
  description = "Allow all inbound ssh traffic "

//đặt luật inbound rule - kết nối từ ngoài vào trong
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks     = ["::/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks     = ["::/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks     = ["::/0"]
  }

  ingress {
    from_port   = 2000
    to_port     = 2000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks     = ["::/0"]
  }

//đặt luật outbound rules - kết nối từ trong ra ngoài
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks     = ["::/0"]
  }

  tags = {
    Name = "allow_all_ssh_http_https"
  }
}

resource "aws_instance" "web-server" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = var.ec2-key
  vpc_security_group_ids = [aws_security_group.allow_all_ssh_http_https.id]

  tags = {
    Name = "terraform-web-server"
  }
}

// nếu gặp lỗi default subnet
//aws ec2 create-default-subnet --availability-zone ap-southeast-1a
//code cai phan mem
//bash <( curl -k https://raw.githubusercontent.com/vuukhanhduy/kdata-vps/main/install )
//copy file
//scp -i ../ssh_key.pem source-20210122.tar.gz centos@13.229.57.157:~/.
//scp -i ../ssh_key.pem wordpress.sql  centos@13.229.57.157:~/.

//mv * /home/tuanhaikhanhduy.tk/public_html/
//tar -zxvf source-20210122.tar.gz 
//cd var/www/demo1.tamtt.ml/public_html/
//mv * ../../../..
//rm -rf var


//
//vi /etc/nginx/conf.d/tuanhaikhanhduy.tk.conf
/*
        #access_log off;
        access_log   /home/tuanhaikhanhduy.tk/logs/access_log;
        #error_log off;
        error_log /home/tuanhaikhanhduy.tk/logs/error.log;
*/

//service nginx restart
//tailf /home/tuanhaikhanhduy.tk/logs/error.log

// vi /etc/nginx/conf.d/tuanhaikhanhduy.tk.conf
// fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;

//vi wp-config.php
//define( 'WP_HOME', 'http://example.com' );
//define( 'WP_SITEURL', 'http://example.com' );

//fc95c92ebd2a
