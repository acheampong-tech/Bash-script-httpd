#!/bin/bash

#Updating all packages and installing Apache

sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

#Script for a customized apache webpage

cd /var/www/html

sudo echo "<html><body><h1>Welcome to my webpage!</h1></body></html>" > /var/www/html/index.html
