FROM debian:12
SHELL ["/bin/bash", "-c"]
COPY init.sql init.sql
COPY inititi.sh inititi.sh
RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/mysql/mariadb.cnf

# VOLUME /var/lib/mysql
RUN mkdir -p /var/lib/mysql /var/run/mysqld
# RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# RUN chmod 777 /var/run/mysqld
# RUN chmod 777 /var/lib/mysql
# VOLUME $HOME/data/mariadb/db
# RUN bash -c "mariadb-install-db --user=mysql --ldata=/var/lib/mysql --defaults-file=/etc/mysql/my.cnf 2>> /var/lib/mysql/loginstall.out 1>> /var/lib/mysql/loginstall.out"
# RUN mysql_secure_installation 
# RUN sleep 2s
EXPOSE 3306
# CMD ["mariadbd", "--user=root", "--datadir=/var/lib/mysql"]
ENTRYPOINT ["sh", "inititi.sh" ]
CMD ["mariadbd", "--user=mysql"]