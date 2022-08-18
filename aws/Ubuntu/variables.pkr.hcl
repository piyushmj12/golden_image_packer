# Declare Your variables here

variable "ami_name" {
  type    = string
  default = "httpd"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-090fa75af13c156b4"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "provisioner_scripts" {
  type    = list(string)
  default = ["../../scripts/install_nginx_linux.sh","../../scripts/install_git.sh"]
}
