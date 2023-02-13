FROM debian:buster
RUN apt update && apt install -y wget php7.3 php7.3-fpm php7.3-mysql mariadb-client sendmail&& \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

# apt search로 php만 grep 해보면 뭐 있는지 나옴
# https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/

COPY tools/* .
RUN chmod +x setup.sh

EXPOSE 9000

ENTRYPOINT ["bash", "setup.sh"]
