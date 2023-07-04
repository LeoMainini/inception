FROM debian:12
RUN apt-get update && apt-get install php-fpm php-mysql -y
STOPSIGNAL SIGQUIT
EXPOSE 9000
# CMD ["/bin/bash"]
# CMD ["/bin/bash", "-c", "bash"]
# RUN cat out.txt
CMD ["php-fpm8.2", "-F", "-R"]
# CMD ["/bin/bash", "-c", "service --status-all | grep \"php\" | xargs -I % service % start"]