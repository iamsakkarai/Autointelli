#!/bin/bash

# Function to check the exit status of the last command
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error: The last command did not execute successfully. Exiting."
        exit 1
    fi
}

cd /var/www/html/ || exit 1
check_status

wget http://dev.autointelli.com/binaries/AI-241122.zip -O UI.zip
check_status

unzip UI.zip
check_status

read -p "Enter the new IP address: " new_ip
check_status

sed -i "s/dev\.autointelli\.com/$new_ip/g" /var/www/html/lib/config/config.js
check_status

cd /etc/nginx/conf.d/ || exit 1
check_status

wget http://dev.autointelli.com/binaries/autointelli_nginx.conf -O autointelli.conf
check_status

systemctl restart nginx
check_status

echo "All steps completed successfully."
check_status