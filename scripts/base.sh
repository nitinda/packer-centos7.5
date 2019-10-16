#!/bin/bash -x

# Configure vagrant user
sudo mkdir -m 700 /home/vagrant/.ssh
sudo wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
sudo chmod 0600 /home/vagrant/.ssh/authorized_keys
sudo chown -R vagrant.vagrant /home/vagrant/.ssh
sudo chcon -R -h system_u:object_r:ssh_home_t:s0 /home/vagrant/.ssh

# Adding sudo access to vagrant user
sudo echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant
sudo echo "Defaults:vagrant !requiretty" >> /etc/sudoers.d/vagrant
sudo chmod 0440 /etc/sudoers.d/vagrant

# Install vboxadd-service and vboxadd

# sudo yum -y install vboxadd-service vboxadd

# sudo systemctl enable vboxadd-service.service
# sudo systemctl enable vboxadd.service

# sudo systemctl start vboxadd.service
# sudo systemctl start vboxadd-service.service


# Rest yum operations
# sudo yum -y update
# sudo yum -y upgrade
sudo yum clean all