chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

if [ ! -f /var/lib/mysql/.initialized ]; then
	echo "initializing mariadb\n"
	mariadb-install-db --user=mysql --ldata=/var/lib/mysql --defaults-file=/etc/mysql/my.cnf 2>> /var/lib/mysql/loginstall.out 1>> /var/lib/mysql/loginstall.out
	"$@" --skip-networking &
	export MDB_PID=$!
	while [ $(sh build.sh 2>&1 >/dev/null | grep "Can't connect to local server through socket" | wc -l) -gt 0 ]
	do
		sleep 1s
	done
	echo "\nfound temp mariadb service and executed build scripts  - - -  exiting temp mariadb service \n"
	kill "$MDB_PID"
	wait "$MDB_PID"
	unset MDB_PID
	touch /var/lib/mysql/.initialized
fi

echo "\nmariadb initialized\n"

exec "$@"
