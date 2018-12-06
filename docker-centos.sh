#!/bin/bash
# https://docs.docker.com/install/linux/docker-ce/centos/#set-up-the-repository
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $(whoami)
sudo systemctl start docker
yum list docker-ce --showduplicates | sort -r	

# https://linuxize.com/post/how-to-install-node-js-on-centos-7/
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs
# sudo docker run -d -p 80:80 nginx
