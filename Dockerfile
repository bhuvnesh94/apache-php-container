FROM ubuntu:18.04
ENV TZ=Etc/UTC
RUN apt update && \
    apt install apache2 -y && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    apt install php -y
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
