if [ ! -f /var/www/init/.initialized ]; then
	echo "initializing initial wordpress config" 
	cd /tmp
	curl -LO https://wordpress.org/latest.tar.gz
	tar xzvf latest.tar.gz
	cd wordpress
	head -n 20 wp-config-sample.php > wp-config.php
	echo "define('DB_NAME', '$MYSQL_DATABASE');" >> wp-config.php
	echo "define('DB_USER', '$MARIADB_WORDPRESS_USER');" >> wp-config.php
	echo "define('DB_PASSWORD', '$MARIADB_WORDPRESS_PASSWORD');" >> wp-config.php
	echo "define('DB_HOST','db:3306');" >> wp-config.php
	echo "define('FS_METHOD', 'direct');" >> wp-config.php
	tail -n 64 wp-config-sample.php | head -n 18 >> wp-config.php
	curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> wp-config.php
	tail -n 38 wp-config-sample.php >> wp-config.php
	cp -a /tmp/wordpress/. /var/www/php
	chown -R www-data:www-data /var/www/php
	wp --allow-root --path=/var/www/php core install --url=$HOSTNAME \
		--title="leferrei's site" --admin_user=$WORDPRESS_ADMIN \
		--admin_password=$WORDPRESS_ADMIN_PASSWORD  --admin_email=$WORDPRESS_ADMIN_EMAIL
	wp --allow-root --path=/var/www/php user create $WORDPRESS_USER \
		$WORDPRESS_USER_EMAIL --role=subscriber --user_pass=$WORDPRESS_USER_PASSWORD
	mkdir /var/www/init
	touch /var/www/init/.initialized
fi
chown -R www-data:www-data /var/www/
echo "wordpress initialized"
exec "$@" 
