#!/bin/bash

echo "$(date) ${HOME}/env/setup.sh start..." >> ${HOME}/install.log

set -x
sudo apt update
sudo apt --yes upgrade

sudo apt --yes install httpie 

#wget -qO - https://raw.githubusercontent.com/starkandwayne/homebrew-cf/master/public.key | sudo apt-key add -
#echo "deb http://apt.starkandwayne.com stable main" | sudo tee /etc/apt/sources.list.d/starkandwayne.list
#sudo apt update
sudo apt --yes install direnv om spruce

#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#sudo touch /etc/apt/sources.list.d/kubernetes.list 
#echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
#sudo apt update
sudo apt --yes install kubectl

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt update
#apt-cache policy docker-ce
sudo apt --yes install docker-ce
sudo usermod -a -G docker $USER

set +x
echo "$(date) ${HOME}/env/setup.sh end." >> ${HOME}/install.log
