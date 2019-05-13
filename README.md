# LAMP stack built with Docker Compose

This is a basic LAMP stack environment built using Docker Compose. It consists following:

* PHP 7.2
* Apache 2.4
* MySQL 5.7
* phpMyAdmin
* redis
* rabbitMQ

As of now, we have 3 different branches for different PHP versions. It is built based on the php official image. Use appropriate branch as per your php version need:
* [5.6.x](https://github.com/vjcspy/docker-lamp/tree/5.6.x)
* [7.1.x](https://github.com/vjcspy/docker-lamp/tree/7.1.x)
* [7.2.x](https://github.com/vjcspy/docker-lamp/tree/7.2.x)

If you familiar with ubuntu, you can use with ubuntu version.
* [7.0.x-ubuntu](https://github.com/vjcspy/docker-lamp/tree/7.0.x-ubuntu)
* [7.1.x-ubuntu](https://github.com/vjcspy/docker-lamp/tree/7.1.x-ubuntu)
* [7.2.x-ubuntu](https://github.com/vjcspy/docker-lamp/tree/7.2.x-ubuntu)

## Installation

Clone this repository on your local computer and switch to branch `7.2.x`. Run the `docker-compose up -d`.

```shell
git clone https://github.com/vjcspy/docker-lamp.git
cd docker-compose-lamp/
git fetch --all
git checkout 7.2.x-ubuntu
docker-compose up -d
```

Your LAMP stack is now ready!! You can access it via `http://localhost`.

## Configuration and Usage

By default following modules are enabled.

* rewrite
* headers

> If you want to enable more modules, just update `./bin/webserver/Dockerfile`. You can also generate a PR and we will merge if seems good for general purpose.
> You have to rebuild the docker image by running `docker-compose build` and restart the docker containers.

#### Connect via SSH

You can connect to web server using `docker exec` command to perform various operation on it. Use below command to login to container via ssh.

```shell
docker exec -it mgt-web /bin/bash
```

## PHP

The installed version of PHP is 7.2 + composer

#### Extensions

By default following extensions are installed.

* cli
* bcmath
* bz2
* common
* mysql
* mysqli
* mbstring
* zip
* soap
* intl
* mcrypt
* curl
* json
* iconv
* xml
* xmlrpc
* gd
* xdebug

> If you want to install more extension, just update `./bin/webserver/Dockerfile`. You can also generate a PR and we will merge if seems good for general purpose.
> You have to rebuild the docker image by running `docker-compose build` and restart the docker containers.

## Redis

It comes with Redis. It runs on default port `6379`.

## RabbitMQ

It runs on default port `5672`.

## Xdebug (Ubuntu version)

Just enable xdebug by, it should be work with no configuration on code editor.

`phpenmode xdebug;service apache2 restart`

##### If you are using phpStorm and want to using php CLI debug. Follow this steps:
1. Config environment variable for CLI

`export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=host.docker.internal remote_connect_back=0"`

2. You need to mapping directory between host and docker. Config it on "deployment setting on PHPstorm" and set environment variable

`export PHP_IDE_CONFIG="serverName=SERVER_NAME"`

