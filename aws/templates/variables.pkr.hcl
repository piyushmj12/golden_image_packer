# Declare Your variables here

locals {
    app_name = "httpd"
}

variable "source_ami" {
  type    = string
  default = "ami-009eff42742f9ba11" 
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
variable "script_install_nginx_ubuntu" {
  type    = string
  default = "install_nginx_ubuntu.sh"
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