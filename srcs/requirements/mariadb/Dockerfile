FROM debian:11
SHELL ["/bin/bash", "-c"]
COPY tools/build.sh build.sh
COPY tools/inititi.sh inititi.sh
COPY tools/healthchecker.sh healthchecker.sh 
RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY tools/my.cnf /etc/mysql/my.cnf
COPY tools/my.cnf /etc/mysql/mariadb.cnf
RUN mkdir -p /var/lib/mysql /var/run/mysqld
EXPOSE 3306
ENTRYPOINT ["sh", "inititi.sh" ]
CMD ["mariadbd", "--user=mysql", "--init-file=/instructions.sql"]