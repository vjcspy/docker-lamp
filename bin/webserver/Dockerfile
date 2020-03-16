FROM webdevops/php-nginx-dev:7.3

RUN apt-get update
RUN apt-get -y upgrade

## Composer install

# RUN curl -sS https://getcomposer.org/installer | php
# RUN mv composer.phar /usr/local/bin/composer

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

## Install cron
# RUN apt-get -y install cron

## Network tool
RUN apt-get -y install htop
RUN apt-get -y install net-tools
RUN apt-get -y install iproute2


# Add crontab file in the cron directory
# ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the cron job
# RUN chmod 0644 /etc/cron.d/hello-cron

# Apply cron job
# RUN crontab /etc/cron.d/hello-cron

# Ports: apache2, xdebug
EXPOSE 80 9000 22 443

# Init
ADD ./utils/init.sh /init.sh
RUN chmod 755 /*.sh

# ENTRYPOINT ["/init.sh"]
