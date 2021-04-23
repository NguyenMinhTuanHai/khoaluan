#!/bin/bash

yum -y install yum-utils epel-release
rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum -y install php-fpm php-ldap php-zip php-embedded php-cli php-mysql php-common php-gd php-xml php-mbstring php-mcrypt php-pdo php-soap php-json php-simplexml php-process php-curl php-bcmath php-snmp php-pspell php-gmp php-intl php-imap perl-LWP-Protocol-https php-pear-Net-SMTP php-enchant php-pear php-devel php-zlib php-xmlrpc php-tidy php-mysqlnd php-opcache php-cli php-pecl-zip unzip gcc
mv /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.bak
chown -R nginx:nginx /var/lib/php/*