if [ $( echo 'SELECT VERSION();' | mariadb --password=$MYSQL_ROOT_PASSWORD  2>&1 >/dev/null  | grep 'connect to local server ' | wc -l ) -eq 0 ]; then
	exit 0 
fi
exit 1 