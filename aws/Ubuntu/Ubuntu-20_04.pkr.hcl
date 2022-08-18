data "aws_caller_identity" "current" {}
data "amazon-ami" "ubuntu_20_04"  {
    filters = {
     name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
     state               = "available"
     root-device-type    = "ebs"
     virtualization-type = "hvm"
     architecture        = "x86_64"

      }
      most_recent = true
      owners      = [data.aws_caller_identity.current.account_id] 
      region      = var.region
     }
source "amazon-ebs" "ubuntu_20_04" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  source_ami   = data.amazon-ami.ubuntu_20_04.id

  
  ssh_username = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = var.ami_name
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]
  provisioner "file"{
    source = var.voci_configuration_scripts
    destination = "~"
  }
  provisioner "shell" {
    scripts          = var.provisioner_scripts
    execute_command = "chmod +x {{ .Path }}; sudo {{ .Vars }} {{ .Path }}"
  }
}
