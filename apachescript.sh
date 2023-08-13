#!/bin/bash

#Update system packages
sudo yum update -y

#Install and start Apache
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
systemctl is-enabled httpd

#Install of firewalld service on Amazon Linux 2
sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld

#Configure firewall to allow services HTTP and HTTPS
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=https --permanent

#Reload firewall to implement added services
sudo firewall-cmd --reload
sudo firewall-cmd --state

#Customize default index page for Apache

cd /var/www/html

sudo echo "<html><body><h1>Welcome to my Apache webpage!</h1></body></html>" > /var/www/html/index.html
