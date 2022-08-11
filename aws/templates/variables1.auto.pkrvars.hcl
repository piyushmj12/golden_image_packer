ami_name      = "httpd"
region        = "us-east-1"
instance_type = "t2.micro"
//ami_regions   = "us-east-1"
//source_ami    = "ami-090fa75af13c156b4"
source_ami    = "ami-076e3a557efe1aa9c"
//-----

provisioner_scripts = "install_nginx_linux.sh"

