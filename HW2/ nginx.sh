#!/bin/bash

dnf -y update && dnf -y install nginx && dnf -y install python3-dnf-plugin-versionlock

touch /etc/nginx/conf.d/site.conf

/bin/echo "server {
        listen 81;
        root /usr/share/nginx/html;
        index index.php index.html index.htm;
        server_name 0.0.0.0;
        charset utf-8;
        error_log /var/log/nginx/site.error.log;
        access_log /var/log/nginx/site.access.log;
        location / {
                try_files \$uri \$uri/ /index.php?\$args;
        }
        location /test {
                rewrite ^(.*)$ https://google.com redirect;
        }
        location ~ /\. {
                deny all;
        }
}" > /etc/nginx/conf.d/site.conf;

systemctl enable nginx
systemctl start nginx

dnf versionlock add nginx

firewall-cmd --permanent --zone=public --add-service=http --add-service=https
firewall-cmd --permanent --zone=public --add-port=81/tcp
firewall-cmd --reload
firewall-cmd --list-services --zone=public