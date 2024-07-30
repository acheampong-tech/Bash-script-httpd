#!/bin/bash

#Update system packages
echo "Please wait, system updating  #######################################################################################:"
sudo yum update -y
sleep 9s

#Install and start Apache
echo "Please wait, httpd installing ######################################################################################:"
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
systemctl is-enabled httpd
sleep 9s


#Install of firewalld service on Amazon Linux 2
echo "Please wait, system installing firewall ######################################################################################:"
sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
sleep 9s


#Configure firewall to allow services HTTP and HTTPS
echo "Please wait, system configuring firewall ######################################################################################:"
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=https --permanent
sleep 9s

#Reload firewall to implement added services
echo "Please wait, system servicing firewall ######################################################################################:"
sudo firewall-cmd --reload
sudo firewall-cmd --state
sleep 9s

#Customize default index page for Apache
sleep 9s
echo "Please wait, deployment happening ######################################################################################:"
cd /var/www/html

sudo echo "<html><body><h1>Welcome to my Apache webpage!</h1></body></html>" > /var/www/html/index.html
