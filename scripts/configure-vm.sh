#!/bin/bash

# Install Apache
sudo apt-get update -y
sudo apt-get install apache2 -y

# Create a simple webpage
echo "<h1>ARM Deployed VM - $(hostname)</h1>" | sudo tee /var/www/html/index.html

# Restart Apache
sudo systemctl restart apache2
