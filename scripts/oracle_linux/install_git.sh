cd /usr/src
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.36.1.tar.gz
tar xzf git-2.36.1.tar.gz
cd git-2.36.1
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc
source /etc/bashrc
git --version
