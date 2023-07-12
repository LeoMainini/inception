FROM debian:12
SHELL ["/bin/bash", "-c"]
COPY build.sh build.sh
COPY inititi.sh inititi.sh
RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/mysql/mariadb.cnf
RUN mkdir -p /var/lib/mysql /var/run/mysqld
EXPOSE 3306
ENTRYPOINT ["sh", "inititi.sh" ]
CMD ["mariadbd", "--user=mysql"]