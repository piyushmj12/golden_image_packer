# data "aws_caller_identity" "current" {}
# data "amazon-ami" "ubuntu_20_04" {
#   filters = {
#     //name              = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20220610"
#     name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
#     state               = "available"
#     root-device-type    = "ebs"
#     virtualization-type = "hvm"
#     architecture        = "x86_64"
#   }
#   owners      = ["422578292388"]
#   most_recent = true

#   //[data.aws_caller_identity.current.account_id]
#   //
#   region = var.region
# }

source "amazon-ebs" "ubuntu_20_04" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  source_ami    = var.source_ami
  communicator  = "ssh"
  source_ami_filter {}
  //source_ami    = data.amazon-ami.ubuntu_20_04.id
  ssh_username = "ubuntu"
  tags = {
    Env  = "DEMO"
    Name = var.ami_name
  }
}


build {
  sources = ["source.amazon-ebs.ubuntu_20_04"]
  provisioner "shell" {
    scripts         = var.provisioner_scripts
    execute_command = "chmod +x {{ .Path }}; sudo {{ .Vars }} {{ .Path }}"
  }
}

# packer build 
# -var "ami_name=nginx_ami" 
# -var "region=us-east-1" 
# -var "provisioner_scripts=[\"../../scripts/ubuntu_scripts/install_git_ubuntu.sh\",\"../../scripts/ubuntu_scripts/install_nginx_ubuntu.sh\"]" .
