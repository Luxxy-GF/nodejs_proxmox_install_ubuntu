#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install qemu-guest-agent
sudo systemctl start qemu-guest-agent
echo "you may have to reboot"
passwd
echo "Setting the ssh config"
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

echo "restarting the ssh"
sudo service ssh restart

echo "all done thanks for using this script"

echo "you can now exit the ssh and login as root user with the password you put"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm use node
sudo apt-get install gcc g++ make
