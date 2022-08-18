data "aws_caller_identity" "current" {}
data "amazon-ami" "oracle_7_9"  {
    filters = {
     name                = "OL7.9-x86_64-HVM-*"
     state               = "available"
     root-device-type    = "ebs"
     virtualization-type = "hvm"
     architecture        = "x86_64"

      }
      most_recent = true
      owners      = [data.aws_caller_identity.current.account_id] 
      region      = var.region
     }

source "amazon-ebs" "oracle_7_9" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  source_ami = var.source_ami

  
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
