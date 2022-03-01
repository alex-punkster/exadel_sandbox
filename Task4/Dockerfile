FROM ubuntu:20.04

ENV CONTAINER_TIMEZONE="Europe/Brussels"
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone


RUN apt update && apt install -y apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/www/html
ENV APACHE_LOG_DIR /var/log/apache2
ENV DEVOPS alex_punkster

RUN echo 'DEVOPS alex_punkster' > /var/www/html/index.html

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
