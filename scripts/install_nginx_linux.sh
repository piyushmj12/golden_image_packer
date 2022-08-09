# Put your code here
#!/bin/bash
# sudo yum -y update
# sudo yum install -y httpd

echo Installing Updates
sudo yum -y update
sudo yum upgrade -y
sudo yum install -y nginx
    
