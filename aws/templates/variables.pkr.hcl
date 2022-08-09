# Declare Your variables here

locals {
  app_name = "httpd"
}

variable "ami_regions" {
  type    = string
  default = "us-east-1"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-090fa75af13c156b4"
}

variable "app_name" {
  type    = string
  default = "Hello123"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

//*****************************************
variable "script_install_java" {
  type    = string
  default = "install_java.sh"
}

//*****************************************
variable "script_install_nginx_linux" {
  type    = string
  default = "install_nginx_linux.sh"
}

//*****************************************
variable "script_install_python" {
  type    = string
  default = "install_python.sh"
}

//*****************************************
variable "script_install_docker" {
  type    = string
  default = "install_docker.sh"
}