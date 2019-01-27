# Docker

## Installation

1. [Sign up for a docker ID](https://store.docker.com/signup)
1. Choose docker CE [from docker store](https://store.docker.com/search?type=edition&offering=community)
1. Open terminal, run `docker -v`
1. `docker run busybox echo hello world`
1. `docker ps -a`
1. `docker rm <image_name>`

## Playing with Alpine (very small [linux container](http://crunchtools.com/comparison-linux-container-images/))

1. `docker run --name myalpine -it --rm alpine sh` for git bash in windows: `winpty docker run --name myalpine -it --rm alpine sh`
1. in separate terminal: `docker ps -a`
1. in alpine shell: `apk update && apk add --no-cache curl git zsh nano`
1. install [oh-my-szh](https://github.com/robbyrussell/oh-my-zsh): `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. `nano ~/.zshrc`
1. choose your [theme](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes), and change ZSH_THEME. e.g.: `ZSH_THEME="bira"`
1. `ctrl + o`, `ctrl + x`
1. `zsh`
1. `exit` x2

## Playing with [node docker image](https://github.com/nodejs/docker-node)

1. `docker run -p 3000:3000 --name mynode -it --rm node:alpine sh`
1. `node -v`
1. `npm -v`
1. `npm install -g create-react-app`
1. `create-react-app --version`
1. `mkdir ~/Projects`
1. `cd ~/Projects`
1. `create-react-app test-react`
1. `cd test-react`
1. `npm start`
1. Open in `localhost:3000` host browser

## Starting postgres

1. `docker pull postgres:alpine`
1. `docker run -p 5432:5432 --name purwadhika-postgres1 -e POSTGRES_PASSWORD=pwd123 -d postgres:alpine`
1. `docker ps -a`
1. `docker exec -it purwadhika-postgres1 psql --version`
1. `docker exec -it purwadhika-postgres1 psql -U postgres -c 'SELECT version();'`
1. `docker exec -it -e PGPASSWORD=pwd123 purwadhika-postgres1 psql -U postgres`
1. `\l`
1. `create database test;`
1. `\c test`
1. `create table users (name text, email text);`
1. `\d`
1. `insert into users values ('kemal', 'kemalelmizan@gmail.com');`
1. `select * from users;`
1. `\q` to quit

## Postgres without daemon, e.g. to run `pg_dump`

1. `docker run -it --rm postgres:alpine bash`
1. `pg_dump --help`
1. `exit`

## Starting mysql

1. `docker pull mysql:latest`
1. `docker run -p 3306:3306 --name purwadhika-mysql1 -e MYSQL_ROOT_PASSWORD=pwd1234 -d mysql:latest`
1. `docker ps -a`
1. `docker exec -it purwadhika-mysql1 mysql --version`
1. `docker exec -it purwadhika-mysql1 mysql -h"localhost" -P"3306" -u"root" -p"pwd1234" -e"SELECT VERSION();"`
1. `docker exec -it purwadhika-mysql1 mysql -u"root" -p"pwd1234"`
1. `create database test;`
1. `show databases;`
1. `connect test;`
1. `create table users (name text, email text);`
1. `show tables;`
1. `insert into users values ('kemal', 'kemalelmizan@gmail.com');`
1. `select * from users;`
1. `\q` to quit

## Creating your own app image

1. Create `hello.js` 
```
console.log('Hello world!')
```
1. `node hello.js`
1. Create `Dockerfile`
```
FROM node:alpine
COPY ./hello.js /
CMD [ "node", "hello.js" ]
```
1. Build your image : `docker build . -t node-hello`
1. Running container : `docker run --name hello-container1 -d node-hello`
1. See container log : `docker logs hello-container1`
1. Remove container : `docker rm hello-container1`
1. Remove image : `docker image rm node-hello`

## Dockerizing Node.js Web App

Follow [this tutorial](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)

## Docker common commands

1. Docker process list : `docker ps -a`
1. Starting container : `docker start <name/ID>`
1. Stopping container : `docker stop <name/ID>`
1. Removing container : `docker rm <name/ID>`
1. List docker images : `docker images`
1. Removing image : `docker image rm <image id>`
1. Copy files from container to host : `docker cp <container name>:/ .`