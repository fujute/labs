#!/bin/bash
# https://docs.docker.com/install/linux/docker-ce/centos/#set-up-the-repository
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker your-user
sudo systemctl start docker
yum list docker-ce --showduplicates | sort -r	
