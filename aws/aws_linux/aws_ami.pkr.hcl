//data "aws_caller_identity" "current" {}

source "amazon-ebs" "httpd" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  source_ami = var.source_ami

  # source_ami_filter {
  #   # filters = {
  #   #   //name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
  #   #   //name                = "amzn2-ami-kernel-5.10-hvm-2.0.20220719.0-x86_64-gp2"
  #   #   root-device-type    = "ebs"
  #   #   virtualization-type = "hvm"

  #   # }
  #   most_recent = true
  #   owners      = [data.aws_caller_identity.current.account_id] 
  #   //["422578292388"]
  # }
  ssh_username = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = var.ami_name
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]
  provisioner "shell" {
    scripts          = var.provisioner_scripts
    execute_command = "chmod +x {{ .Path }}; sudo {{ .Vars }} {{ .Path }}"
  }
}
