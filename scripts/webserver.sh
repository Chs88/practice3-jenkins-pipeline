#! /bin/bash

sleep 30
sudo apt-get -y update
sudo apt-get -y install apache2
sudo apt-get -y install docker.io
sudo rm /var/www/html/index.html
sudo touch /var/www/html/index.html
sudo echo "hello mate" > /var/www/html/index.html ##testing purposes

