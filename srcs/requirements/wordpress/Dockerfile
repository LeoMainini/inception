FROM debian:12
RUN apt-get update && apt-get install php-fpm php-mysql -y
STOPSIGNAL SIGQUIT
RUN mv /etc/php/8.2/fpm/pool.d/www.conf /etc/php/8.2/fpm/pool.d/00-default-config.conf
COPY php-fpm.conf /etc/php/8.2/fpm/pool.d/01-custon-config.conf
EXPOSE 9000
# RUN sed -e 's/127.0.0.1:9000/9000/' \
#         -e '/allowed_clients/d' \
#         -e '/catch_workers_output/s/^;//' \
#         -e '/error_log/d' 
# CMD ["/bin/bash"]
# CMD ["/bin/bash", "-c", "bash"]
# RUN cat out.txt
CMD ["php-fpm8.2", "-F", "-R"]
# CMD ["/bin/bash", "-c", "service --status-all | grep \"php\" | xargs -I % service % start"]