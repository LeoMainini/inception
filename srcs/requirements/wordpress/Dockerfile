FROM debian:12
RUN apt-get update && apt-get install curl php-fpm php-mysql \
	php-curl php-gd php-intl php-mbstring php-soap \
	php-xml php-xmlrpc php-zip -y
COPY tools/init.sh ~/init.sh
COPY tools/php-fpm.conf /etc/php/8.2/fpm/pool.d/01-custon-config.conf
STOPSIGNAL SIGQUIT
RUN mv /etc/php/8.2/fpm/pool.d/www.conf /etc/php/8.2/fpm/pool.d/00-default-config.conf
EXPOSE 9000
ENTRYPOINT ["sh", "~/init.sh" ]
CMD ["php-fpm8.2", "-F", "-R"]
