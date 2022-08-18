sudo yum update -y
sudo yum install https://repo.ius.io/ius-release-el$(rpm -E '%{rhel}').rpm
sudo yum update -y
sudo yum install -y python3
python3 --version
