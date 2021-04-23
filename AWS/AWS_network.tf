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