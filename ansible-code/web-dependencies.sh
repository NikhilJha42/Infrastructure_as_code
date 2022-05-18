#!bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install nginx -y

#sudo rm /etc/nginx/sites-available/default

# install software-properties-common
sudo apt-get install software-properties-common -y

# install nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# cd into app
cd app/
npm install
npm start
