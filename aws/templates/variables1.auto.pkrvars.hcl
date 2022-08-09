ami_name      = "httpd"
region        = "us-east-1"
instance_type = "t2.micro"
ami_regions   = "us-east-1"
source_ami    = "ami-090fa75af13c156b4"
//-----

provisioner_scripts = "install_nginx_linux.sh"

