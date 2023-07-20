chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

if [ ! -f /var/lib/mysql/.initialized ]; then
	echo "initializing mariadb\n"
	mariadb-install-db --user=mysql --ldata=/var/lib/mysql --defaults-file=/etc/mysql/my.cnf 2>> /var/lib/mysql/loginstall.out 1>> /var/lib/mysql/loginstall.out
	touch /var/lib/mysql/.initialized
fi
echo "\nmariadb initialized\n"

sh build.sh
exec "$@"
