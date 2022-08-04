variable "ami_id" {
  type    = string
  default = "ami-08df646e18b182346"
}

variable "app_name" {
  type    = string
  default = "httpd"
}

locals {
    app_name = "httpd"
}

source "amazon-ebs" "httpd" {
  ami_name      = "PACKER-DEMO-${local.app_name}"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  access_key = "AKIATDVBJ3OSZFW4WLUQ"
  secret_key = "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"
  source_ami    = "${var.ami_id}"
  ssh_username  = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]

  provisioner "shell" {
    script = "script/script.sh"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}
