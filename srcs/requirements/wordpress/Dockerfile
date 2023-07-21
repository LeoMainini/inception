FROM debian:11
RUN apt-get update && apt-get install curl php-fpm php-mysql \
	php-curl php-gd php-intl php-mbstring php-soap \
	php-xml php-xmlrpc php-zip less -y
COPY tools/init.sh ~/init.sh
COPY tools/healthchecker.sh healthchecker.sh
STOPSIGNAL SIGQUIT
RUN mkdir /run/php && chown -R www-data:www-data /run/php
RUN mv /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/00-default-config.conf
RUN echo "listen = 9000" > /etc/php/7.4/fpm/pool.d/01-custom-config.conf
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
EXPOSE 9000
ENTRYPOINT ["sh", "~/init.sh" ]
CMD ["php-fpm7.4", "-F", "-R"]
