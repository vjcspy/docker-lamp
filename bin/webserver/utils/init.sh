#!/bin/bash
echo "start server"

# enable all site
for filename in /etc/apache2/sites-available/*.conf; do
    if [[ $(basename ${filename}) != "000-default.conf" ]] && [[ $(basename ${filename}) != "default-ssl.conf" ]] && [[ $(basename ${filename}) != "default.conf" ]]
     then
        a2ensite $(basename ${filename})
    fi
done

# config hosts
HOST_DOMAIN="host.docker.internal"
ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
if [ $? -ne 0 ]; then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  echo -e "$HOST_IP\t$HOST_DOMAIN" >> /etc/hosts
fi

# setup debug cli
#export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=docker.for.mac.localhost remote_connect_back=0"
#export PHP_IDE_CONFIG="serverName=mage2"

phpdismod xdebug

echo "start apache"
exec apachectl -D FOREGROUND

