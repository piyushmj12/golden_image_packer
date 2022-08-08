source "amazon-ebs" "httpd" {
  ami_name      = "${local.app_name}"
  instance_type = "${var.instance_type}"
  region        = "${var.region}"
  source_ami    = "${var.ami_id}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username  = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]
  
  provisioner "shell" {
    script = "scripts/${var.script_install_nginx_ubuntu}"
  }
  
  /*
  post-processor "shell-local" {
    inline = ["echo foo"]
  }
  */ 
}
