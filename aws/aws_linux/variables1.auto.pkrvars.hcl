ami_name      = "httpd"
region        = "us-east-1"
instance_type = "t2.micro"
source_ami    = "ami-090fa75af13c156b4"
//-----
# script_install_nginx_linux = "install_nginx_linux.sh"
# script_install_docker      = "install_docker.sh"
//provisioner_scripts        = "../../scripts/install_nginx_linux.sh"
provisioner_scripts        = ["../../scripts/install_nginx_linux.sh","../../scripts/install_git.sh"]




