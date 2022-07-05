FROM ubuntu:18.04
ENV TZ=Etc/UTC
RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
RUN apt install apache2 -y && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf
ENV TZ=Etc/UTC
RUN  apt install php -y
RUN rm -rf /var/www/html/*
WORKDIR /var/www/html
COPY index.php /var/www/html/index.php
#COPY helo.php /var/www/html/.
#COPY index.html /var/www/html/.
RUN apt-get install -y default-mysql-client
RUN echo "extension=mysqli" >> /etc/php/7.2/apache2/php.ini
RUN apt-get install php-mysql -y
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
