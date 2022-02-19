#!/bin/bash
sudo apt-get update
sudo apt -y install apache2
sudo service apache2 start
sudo apt -y install php7.4 php7.4-fpm
sudo service php7.4-fpm start
sudo a2enmod actions fcgid alias proxy_fcgi
sudo rm -f /etc/apache2/sites-available/000-default.conf

cd /etc/apache2/sites-available

sudo bash -c "cat >> 000-default.conf" <<'endmsg'
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
sudo rm -f /var/www/html/index.html

sudo bash -c "cat > index.php" <<'endmsg'
<?php
echo "OS Version:";
$output = shell_exec('lsb_release -a');
echo "<pre>$output</pre>";

echo "Free disk space:";
$output = shell_exec('df -h --total');
echo "<pre>$output</pre>";

echo "Memory usage:";
$output = shell_exec('free -m');
echo "<pre>$output</pre>";

echo "Running processes:";
$output = shell_exec('ps -aux');
echo "<pre>$output</pre><br/> ";
echo "<img src='https://alex-punkster-bucket.s3.eu-central-1.amazonaws.com/screenshot.png'>";
?>
endmsg

sudo service apache2 restart
