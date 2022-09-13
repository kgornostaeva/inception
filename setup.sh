#!/bin/bash

echo -e "\033[1;33mLoading and updating OS\033[0m\n"
	sudo apt-get update -y && sudo apt-get upgrade -y
	sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    export PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"

	echo -e "\033[1;33mLoading docker\033[0m\n"
	sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

  echo -e "\033[1;33mLoading kubectl\033[0m\n"
  sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  sudo chmod +x /usr/local/bin/kubectl

#     nslookup get docker.com
#     curl -fsSL https://get.docker.com | bash
#     usermod -aG docker $USER


# 	cd /vagrant
# 	make