#!/bin/bash

#Install ruby
apt update
apt install -y ruby-full ruby-bundler build-essential

#Add keys and repo for MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

#Update packs and install mongodb-org
apt update
apt install -y mongodb-org

#Start MongoDB
systemctl start mongod

#Add to autorun
systemctl enable mongod

#Install git
apt update
apt install -y git

#Move to users's folder for installing Reddit app
cd /home/ubuntu

#Copy Reddit app code to our server
git clone -b monolith https://github.com/express42/reddit.git

#Move to Reddit's directory and install bundle
cd reddit && bundle install

#Start the app server
#puma -d

#Start the app using systemd unit
sudo cp /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl enable puma.service
sudo systemctl start puma.service
