FROM debian
RUN apt-get update && apt-get install mariadb-server
RUN mysql_secure_installation
RUN mariadb
RUN CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
RUN GRANT ALL ON wordpress.* TO 'leferrei'@'localhost' IDENTIFIED BY 'password';
RUN FLUSH PRIVILEGES;
RUN EXIT;