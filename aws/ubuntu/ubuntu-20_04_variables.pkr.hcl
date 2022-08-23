# Declare Your variables here

variable "name" {
  type = string
  default = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}
variable "state" {
  type = string
  default = "available"
}
variable "root-device-type" {
  type = string
  default = "ebs"
}
variable "virtualization-type" {
  type = string
  default = "hvm"
}
variable "architecture" {
  type = string
  default = "x86_64"
}

variable "owner" {
  type = string
  default = "422578292388"
}
//**************************************************************/
variable "ami_name" {
  type    = string
  default = "httpd"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami_regions" {
  type    = list(string)
  default = []
}
variable "source_ami" {
  type    = string
  default = "ami-08d4ac5b634553e16" //Ubuntu Server 20.04 LTS
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "provisioner_scripts" {
  type = list(string)
  default = ["../../scripts/ubuntu/install_git_ubuntu.sh",
  "../../scripts/ubuntu/install_nginx_ubuntu.sh"]
}
