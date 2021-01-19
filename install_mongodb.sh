#!/bin/bash
#Add keys and repo for MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

#Install mongodb-org
sudo apt-get update
sudo apt-get install -y mongodb-org
#Start MongoDB
sudo systemctl start mongod

#Add to autorun
sudo systemctl enable mongod

#Show status
sudo systemctl status mongod
