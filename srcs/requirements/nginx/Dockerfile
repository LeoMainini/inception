FROM debian:12
RUN apt-get -y update && apt-get -y install nginx
RUN rm -f /etc/nginx/sites-enabled/default
COPY tools/nginx.conf /etc/nginx
COPY tools/php.conf /etc/nginx/conf.d
EXPOSE 443
# EXPOSE 80
#CMD ["/usr/sbin/nginx", "-h"]

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
