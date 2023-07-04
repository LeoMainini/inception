FROM debian:12
RUN apt-get update && apt-get install php-fpm php-mysql -y
CMD ["/bin/bash", "-c", "service php8.2-fpm start"]
# CMD ["/bin/bash", "-c", "service --status-all | grep \"php\" | xargs -I % service % start"]