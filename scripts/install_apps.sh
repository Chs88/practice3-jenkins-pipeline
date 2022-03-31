#!/bin/bash

sudo apt-get update -y


# Installing Java JDK 8"
sudo apt remove -y java
sudo apt-get install -y java-1.8.0-openjdk
# Installing Jenkins
## Before install is necessary to add Jenkins to trusted keys and source list
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get install -y jenkins
sudo chkconfig jenkins on

# Installing Docker engine"
sudo apt-get install -y docker
sudo chkconfig docker on