#!/bin/bash
apt update -y
apt install -y nginx
systemctl start nginx
systemctl enable nginx
echo "Nginx installed successfully via Terraform!" > /var/www/html/index.html
