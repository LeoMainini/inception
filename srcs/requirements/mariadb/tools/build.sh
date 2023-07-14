echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" > instructions.sql
echo "CREATE USER IF NOT EXISTS '$MARIADB_WORDPRESS_USER'@'%' IDENTIFIED BY '$MARIADB_WORDPRESS_PASSWORD';" >> instructions.sql;
echo "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_WORDPRESS_USER'@'%' IDENTIFIED BY '$MARIADB_WORDPRESS_PASSWORD';" >> instructions.sql
echo "ALTER USER 'root'@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> instructions.sql
echo "ALTER USER 'mysql'@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> instructions.sql

echo "FLUSH PRIVILEGES;" >> instructions.sql
cat instructions.sql > /var/lib/mysql/instructions-log.txt
echo "" >> /var/lib/mysql/instructions-log.txt

mariadb < instructions.sql  