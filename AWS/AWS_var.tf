variable "ec2-key" {
  default = "ssh_key"
}

//mã ami lấy tại https://wiki.centos.org/Cloud/AWS#head-78d1e3a4e6ba5c5a3847750d88266916ffe6
//ami-0adfdaea54d40922b
//mã CentOS 7 modified
//ami-07947846e41d565a2
//mã ubuntu server 20.04 
//ami-01581ffba3821cdf3
variable "ami" {
  default = "ami-0adfdaea54d40922b"
}

variable "ssh_key" {
  default = "ssh_key.pem"
}