FROM debian:12
RUN apt-get update
RUN apt-get install mariadb-server -y
CMD ["mysql"]
# RUN select version();
# # RUN mysql_secure_installation
# RUN CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# RUN GRANT ALL ON wordpress.* TO 'leferrei'@'localhost' IDENTIFIED BY 'password';
# RUN FLUSH PRIVILEGES;
# RUN EXIT;