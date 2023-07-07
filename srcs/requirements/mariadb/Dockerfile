FROM debian:12
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/mysql/mariadb.cnf
EXPOSE 3306
CMD ["mariadbd", "--datadir='/var/lib/mysql'", "--user=root"]
# CMD ["tail", "/dev/random"]
# CMD ["mariadbd"]
# RUN mysql_secure_installation
# RUN mysql
# RUN select version();
# RUN CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# RUN GRANT ALL ON wordpress.* TO 'leferrei'@'localhost' IDENTIFIED BY 'password';
# RUN FLUSH PRIVILEGES;
# RUN EXIT;