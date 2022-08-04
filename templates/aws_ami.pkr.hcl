variable "ami_id" {
  type    = string
  default = "" 
}

variable "app_name" {
  type    = string
  default = ""
}

locals {
    app_name = "httpd"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

source "amazon-ebs" "httpd" {
  ami_name      = "PACKER-DEMO-${local.app_name}"
  instance_type = "${var.instance_type}"
  region        = "${var.region}"
  access_key = " "
  secret_key = " "
  source_ami    = "${var.ami_id}"
  ssh_username  = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]
  /*
  provisioner "shell" {
    script = "script/script.sh"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
  */ 
}
