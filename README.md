# Docker Training

## Installation

1. [Sign up for a docker ID](https://store.docker.com/signup)
1. Choose docker CE [from docker store](https://store.docker.com/search?type=edition&offering=community)
1. Open terminal, run `docker -v`

## Starting postgres

1. `docker pull postgres:latest`
1. `docker run -p 5432:5432 --name purwadhika-postgres1 -e POSTGRES_PASSWORD=pwd123 -d postgres:latest`
1. `docker ps -a`
1. `docker exec -it purwadhika-postgres1 psql --version`
1. `docker exec -it purwadhika-postgres1 psql -U postgres -c 'SELECT version();'`
1. `docker exec -it -e PGPASSWORD=pwd123 purwadhika-postgres1 psql -U postgres`
1. `\q` to quit

## Starting mysql

1. `docker pull mysql:latest`
1. `docker run -p 3306:3306 --name purwadhika-mysql1 -e MYSQL_ROOT_PASSWORD=pwd1234 -d mysql:latest`
1. `docker ps -a`
1. `docker exec -it purwadhika-mysql1 mysql --version`
1. `docker exec -it purwadhika-mysql1 mysql -h"localhost" -P"3306" -u"root" -p"pwd1234" -e"SELECT VERSION();"`
1. `docker exec -it purwadhika-mysql1 mysql -u"root" -p"pwd1234"`
1. `\q` to quit

## Creating your own app image

1. Create `hello.js` 
```
console.log('Hello world!')
```
1. `node hello.js`
1. Create `Dockerfile`
```
FROM node:latest
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