# data "amazon-ami" "ubuntu_20_04" {
  
#   filters = {
#     name = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
#     root-device-type    = "ebs"
#     virtualization-type = "hvm"
#     # state               = "available"
#     # architecture        = "amd64"
#   }
#   owners      = [var.owner]
#   most_recent = true
#   region      = var.region
# }
source "amazon-ebs" "ubuntu_20_04" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  source_ami = var.source_ami
  ami_regions  = var.ami_regions
  //source_ami   = data.amazon-ami.ubuntu_20_04.id
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


/*
packer build -var "ami_name=ubuntu_ami" -var "region=us-east-1"  -var "provisioner_scripts=[\"../../scripts/ubuntu/install_git_ubuntu.sh\",\"../../scripts/ubuntu/install_nginx_ubuntu.sh\"]" .
*/
