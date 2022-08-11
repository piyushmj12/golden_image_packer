# golden_image_packer


COMMANDS TO BUILD IMAGE BY USING PACKER TEMPLATE 
packer build --var-file=variables1.auto.pkrvars.hcl .
OR
packer build -var "ami_name=nginx_ami" -var "region=us-east-1" -var "provisioner_scripts=install_nginx_linux.sh" .



