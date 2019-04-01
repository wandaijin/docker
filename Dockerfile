FROM  ubuntu:14.04
LABEL maintainer="wandaijin@outlook.com"
RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install php5-fpm
RUN apt-get -y install php5-cli
RUN apt-get -y install php5-imagick
RUN apt-get -y install php5-gd
RUN apt-get -y install php5-curl
RUN apt-get -y install php5-mysql
RUN apt-get -y install php5-redis
RUN apt-get -y install php5-mcrypt
VOLUME ["/www", "/etc/nginx/sites-enabled/"]
COPY ./docker/docker-entry.sh /
COPY ./docker/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/php-cli.ini /etc/php5/cli/php.ini
COPY ./docker/php-fpm.ini /etc/php5/fpm/php.ini
ENTRYPOINT [ "sh", "-c", "/docker-entry.sh"]