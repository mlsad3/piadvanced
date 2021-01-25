#!/bin/sh
## php

sudo apt-get install -t stretch -y php8.0
sudo apt-get install -t stretch -y php8.0-curl
sudo apt-get install -t stretch -y php8.0-gd
sudo apt-get install -t stretch -y php8.0-fpm
sudo apt-get install -t stretch -y php8.0-opcache
sudo apt-get install -t stretch -y php8.0-opcache
sudo apt-get install -t stretch -y php8.0-mbstring
sudo apt-get install -t stretch -y php8.0-xml 
sudo apt-get install -t stretch -y php8.0-zip
sudo systemctl enable php8.0-fpm
