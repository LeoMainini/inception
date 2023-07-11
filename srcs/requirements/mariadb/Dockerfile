FROM debian:12
COPY init.sql /docker-entrypoint-initdb.d/init.sql
COPY init.sh init.sh
RUN apt-get update
RUN apt-get install mariadb-server -y
RUN chown -R mysql /var/lib/mysql
RUN chgrp -R mysql /var/lib/mysql
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/mysql/mariadb.cnf
RUN rm -rf /var/lib/mysql
RUN mkdir -p /var/lib/mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
VOLUME $HOME/data/mariadb/db:/var/lib/mysql
RUN mariadb-install-db --user=root --datadir=/var/lib/mysql 2> /var/lib/mysql/loginstall.out
# RUN sleep 2s
EXPOSE 3306
CMD ["mysqld_safe", "--user=root"]
# ENTRYPOINT ["sh", "init.sh" ]
# CMD ["sleep", "infinity"]
# CMD ["mariadbd"]
# RUN mysql_secure_installation
# RUN mysql
# RUN select version();
# RUN CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# RUN GRANT ALL ON wordpress.* TO 'leferrei'@'localhost' IDENTIFIED BY 'password';
# RUN FLUSH PRIVILEGES;
# RUN EXIT;