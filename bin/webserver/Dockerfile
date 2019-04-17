FROM ubuntu:18.04
LABEL maintainer Khoi Le <mr.vjcspy@gmail.com>

# Environments vars
ENV TERM=xterm

RUN apt-get update
RUN apt-get -y upgrade

# Packages installation
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --fix-missing install apache2 \
      php7.2 \
      php7.2-cli \
      php7.2-bcmath \
      php7.2-bz2 \
      php7.2-common \
      php7.2-intl \
      php7.2-gd \
      php7.2-json \
      php7.2-mbstring \
      php7.2-xml \
      php7.2-mysql \
      php7.2-xsl \
      php7.2-zip \
      php7.2-soap \
      libapache2-mod-php \
      curl \
      php7.2-curl \
      apt-transport-https \
      nano \
      php7.2-xdebug

RUN a2enmod rewrite

RUN apt-get -y install gcc make autoconf libc-dev pkg-config
RUN apt-get -y install libmcrypt-dev
RUN apt-get -y install libmcrypt-dev
RUN apt-get -y install php-pear php7.2-dev libyaml-dev
RUN pecl channel-update pecl.php.net
RUN pecl install mcrypt-1.0.1

# Composer install
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# openssh-server
# RUN apt-get update && apt-get install -y openssh-server
# RUN mkdir /var/run/sshd
# RUN echo 'root:1' | chpasswd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile
# RUN /usr/sbin/sshd -D

# Install cron
RUN apt-get -y install cron

# Add crontab file in the cron directory
# ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the cron job
# RUN chmod 0644 /etc/cron.d/hello-cron

# Apply cron job
# RUN crontab /etc/cron.d/hello-cron

# Init
ADD ./utils/init.sh /init.sh
ADD ./utils/up.sh /up.sh
RUN chmod 755 /*.sh

# Add phpinfo script for INFO purposes
RUN echo "<?php phpinfo();" >> /var/www/index.php

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/

# Volume
VOLUME /var/www

# Ports: apache2, xdebug
EXPOSE 80 9000 22

CMD ["/init.sh"]
