if ( ! -f /var/www/php/certs/leferrei.42.fr+3.pem ); then
	echo "generating ssl certificate"
	wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
	mv mkcert-v1.4.3-linux-amd64 /usr/bin/mkcert
	chmod +x /usr/bin/mkcert
	mkcert leferrei.42.fr localhost 127.0.0.1 ::1
	mkdir /var/www/php/certs
	cp leferrei.42.fr+3* /var/www/php/certs
fi
chown -R www-data:www-data /var/www/php
exec "$@"