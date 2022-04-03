#! /bin/bash


sleep 30
sudo apt-get -y update
sudo apt-get -y install docker.io


sudo docker pull jenkins/jenkins:lts-jdk11
sudo docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11