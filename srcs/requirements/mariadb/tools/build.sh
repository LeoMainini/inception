echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASEDEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" > instructions.sql
echo "CREATE USER IF NOT EXISTS $MARIADB_WORDPRESS_USER@localhost IDENTIFIED BY '$MARIADB_WORDPRESS_PASSWORD';" >> instructions.sql;
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MARIADB_WORDPRESS_USER'@localhost;" >> instructions.sql
echo "ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> instructions.sql
echo "ALTER USER mysql@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> instructions.sql

echo "FLUSH PRIVILEGES;" >> instructions.sql
cat instructions.sql > /var/lib/mysql/instructions-log.txt
echo "" >> /var/lib/mysql/instructions-log.txt
cat instructions.sql > mariadb