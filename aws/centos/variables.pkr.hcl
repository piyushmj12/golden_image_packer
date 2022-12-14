variable "ami_name" {
  type    = string
  default = "httpd"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "ami_regions" {
  type = list(string)
  default = []
}

variable "source_ami" {
  type    = string
  default = "ami-04745ee7d4c0fb5fd"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "provisioner_scripts" {
  type    = list(string)
  default = ["../../scripts/centos/install_nginx_centos.sh","../../scripts/centos/install_git_centos.sh"]
}

variable "owner" {
  type = string
  default = "422578292388"
}

# variable "script_install_nginx_linux" {
#   type    = string
#   default = "install_nginx_linux.sh"
# }

# variable "script_install_docker" {
#   type    = string
#   default = "install_docker.sh"
# }

//*****************************************















# # Declare Your variables here

# variable "ami_name" {
#   type    = string
#   default = "httpd"
# }

# variable "region" {
#   type    = string
#   default = "us-east-1"
# }

# variable "source_ami" {
#   type    = string
#   default = "ami-090fa75af13c156b4"
# }

# variable "instance_type" {
#   type    = string
#   default = "t2.micro"
# }

# variable "provisioner_scripts" {
#   type    = list(string)
#   default = ["../../scripts/install_nginx_linux.sh","../../scripts/install_git.sh"]
# }




# # variable "script_install_nginx_linux" {
# #   type    = string
# #   default = "install_nginx_linux.sh"
# # }

# # variable "script_install_docker" {
# #   type    = string
# #   default = "install_docker.sh"
# # }

# //*****************************************


# //*****************************************
