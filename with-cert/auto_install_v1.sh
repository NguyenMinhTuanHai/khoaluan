#!/bin/bash

# Read variables
echo -n "Nhap username: "
read username
while [ ! -d "$(find /usr/local/directadmin/data/users/ -name $username)" ]
do
        echo -n "Nhap sai username vui long nhap lai: "
        read username
done

echo -n "Nhap domain: "
read domain
while [ ! -d "$(find /home/$username/domains -name $domain)" ]
do
        echo -n "Nhap sai domain vui long nhap lai: "
        read domain
done

echo -n "Nhap database: "
read db
echo -n "Nhap database password: "
read db_pass


# download sources code
cd ~
wget -O source.zip https://store.etrustcloud.com/s/7FgoQTS4XaeEKkK/download
unzip -q source.zip
rm -rf /home/$username/domains/$domain/public_html/*
mv public_html/* /home/$username/domains/$domain/public_html

# import db
cd /home/$username/domains/$domain/public_html
mysql -u $db -p"$db_pass" $db < db.sql
chown -R $username:$username *
mv htaccess .htaccess

# change app-config.php
sed -i "s/^.*APP_BASE_URL.*$/define('APP_BASE_URL', 'http:\/\/$domain\/');/" application/config/app-config.php
sed -i "s/^.*APP_DB_USERNAME.*$/define('APP_DB_USERNAME', '$db');/" application/config/app-config.php
sed -i "s/^.*APP_DB_PASSWORD.*$/define('APP_DB_PASSWORD', '$db_pass');/" application/config/app-config.php
sed -i "s/^.*APP_DB_NAME.*$/define('APP_DB_NAME', '$db');/" application/config/app-config.php

cd ~
rm -rf source.zip public_html
echo "Completed!"