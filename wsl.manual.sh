dpkg-reconfigure openssh-server
wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb
dpkg -i vagrant_2.0.0_x86_64.deb
rm vagrant_2.0.0_x86_64.deb
vagrant plugin install vagrant-hostmanager vagrant-omnibus vagrant-berkshelf
pip install awscli --upgrade --user
