FROM debian:buster

ARG MYSQL_DB
ARG MYSQL_ROOT_PWD
ARG MYSQL_USER
ARG MYSQL_USER_PWD

ENV DB=${MYSQL_DB}
ENV ROOT_PWD=${MYSQL_ROOT_PWD}
ENV USER=${MYSQL_USER}
ENV USER_PWD=${MYSQL_USER_PWD}

RUN apt update && apt install -y mariadb-server
# https://wiki.alpinelinux.org/wiki/MariaDB
# 여기에 mysql_secure_installation 명령어 나옴
# alpine에서 데몬 서비스 돌릴라면 apk add openrc해서
# rc-service mysql start 해야하는데 안 먹힘, 걍 데비안 쓰는 게 낫다

COPY tools/* .
RUN chmod +x setup.sh

RUN sed -i 's/bind-address.*=.*127.0.0.1/#bind-address = 127.0.0.1/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start && sh setup.sh

EXPOSE 3306

ENTRYPOINT ["mysqld"]
