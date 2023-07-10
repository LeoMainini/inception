FROM debian:12
RUN apt-get update
RUN apt-get install mariadb-server -y
RUN chown -R mysql /var/lib/mysql
RUN chgrp -R mysql /var/lib/mysql
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/mysql/mariadb.cnf
COPY init.sh init.sh
# COPY 50-server-patched.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
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