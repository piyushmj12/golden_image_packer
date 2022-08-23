# Declare Your variables here


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
  default = ["../../scripts/ubuntu/install_git_ubuntu.sh"]
}
