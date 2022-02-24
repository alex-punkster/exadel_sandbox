#!/bin/bash
#install apache2
apt-get update
apt -y install apache2
service apache2 start
apt -y install php7.4 php7.4-fpm
service php7.4-fpm start
a2enmod actions fcgid alias proxy_fcgi
rm -f /etc/apache2/sites-available/000-default.conf
cd /etc/apache2/sites-available
bash -c "cat >> 000-default.conf" <<'endmsg'
<VirtualHost *:80>
ServerName example.com
ServerAlias www.example.com
DocumentRoot /var/www/html

<Directory /var/www/html>
Options -Indexes +FollowSymLinks +MultiViews
AllowOverride All
Require all granted
</Directory>

<FilesMatch \.php$>
 # 2.4.10+ can proxy to unix socket
SetHandler "proxy:unix:/var/run/php/php7.4-fpm.sock|fcgi://localhost"
</FilesMatch>

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
endmsg
cd /var/www/html
rm -f /var/www/html/index.html
bash -c "cat > index.php" <<'endmsg'
<?php
echo "OS Version:";
$output = shell_exec('lsb_release -a');
echo "<pre>$output</pre>";
?>

endmsg

service apache2 restart
#install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
