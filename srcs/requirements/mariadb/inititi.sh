if [ ! -f /var/lib/mysql/.initialized ]; then
	echo "initializing mariadb"
	ls -mla /var/lib/mysql
	touch /var/lib/mysql/.initialized
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
	chown root:root /var/lib/mysql/.initialized
	mariadb-install-db --user=mysql --ldata=/var/lib/mysql --defaults-file=/etc/mysql/my.cnf 2>> /var/lib/mysql/loginstall.out 1>> /var/lib/mysql/loginstall.out
	exec $@
	# sleep infinity
else
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
	echo "mariadb initialized"
	exec $@
	# sleep infinity
fi