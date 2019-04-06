# LAMP stack built with Docker Compose

This is a basic LAMP stack environment built using Docker Compose. It consists following:

* PHP 7.2
* Apache 2.4
* MySQL 5.7
* phpMyAdmin

As of now, we have 3 different branches for different PHP versions. Use appropriate branch as per your php version need:
* [5.6.x](https://github.com/vjcspy/docker-lamp/tree/5.6.x)
* [7.1.x](https://github.com/vjcspy/docker-lamp/tree/7.1.x)
* [7.2.x](https://github.com/vjcspy/docker-lamp/tree/7.2.x)

## Installation

Clone this repository on your local computer and switch to branch `7.2.x`. Run the `docker-compose up -d`.

```shell
git clone https://github.com/vjcspy/docker-lamp.git
cd docker-compose-lamp/
git fetch --all
git checkout 7.2.x
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
docker exec -it 7.2.x-webserver /bin/bash
```

## PHP

The installed version of PHP is 7.2

#### Extensions

By default following extensions are installed.

* mysqli
* mbstring
* zip
* intl
* mcrypt
* curl
* json
* iconv
* xml
* xmlrpc
* gd

> If you want to install more extension, just update `./bin/webserver/Dockerfile`. You can also generate a PR and we will merge if seems good for general purpose.
> You have to rebuild the docker image by running `docker-compose build` and restart the docker containers.

## phpMyAdmin

phpMyAdmin is configured to run on port 8080. Use following default credentials.

http://localhost:8080/  
username: root  
password: tiger

## Redis

It comes with Redis. It runs on default port `6379`.
