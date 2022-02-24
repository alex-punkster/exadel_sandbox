#!/bin/bash
sudo rpm -ivh nginx-1.20.1-1.el7.ngx.x86_64.rpm
cd /usr/share/nginx/html
sudo rm /usr/share/nginx/html/index.html
sudo bash -c "cat > index.html" <<'endmsg'
hello world
endmsg
sudo service nginx start
