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
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
