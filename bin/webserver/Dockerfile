FROM ubuntu:18.04
LABEL maintainer Khoi Le <mr.vjcspy@gmail.com>

# Environments vars
ENV TERM=xterm

RUN apt-get update
# RUN apt-get -y upgrade

#php7.1 may not be availabel in Ubuntu default package. Add to get from 3rd repo
RUN apt-get install -y software-properties-common --fix-missing
RUN add-apt-repository ppa:ondrej/php

# Packages installation
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --fix-missing install apache2 \
      php7.0 \
      php7.0-cli \
      php7.0-bcmath \
      php7.0-bz2 \
      php7.0-common \
      php7.0-intl \
      php7.0-gd \
      php7.0-json \
      php7.0-mbstring \
      php7.0-xml \
      php7.0-mysql \
      php7.0-xsl \
      php7.0-gd \
      php7.0-mcrypt \
      php7.0-zip \
      php7.0-soap \
      libapache2-mod-php7.0 \
      curl \
      php7.0-curl \
      apt-transport-https \
      nano \
      php7.0-xdebug

RUN a2enmod rewrite

# PEAR
RUN apt-get -y install php-pear
RUN pecl channel-update pecl.php.net

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
#RUN apt-get -y install cron

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
