FROM debian:12
RUN apt-get -y update && apt-get -y install nginx
RUN rm -f /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx
COPY php.conf /etc/nginx/conf.d
EXPOSE 443
#CMD ["/usr/sbin/nginx", "-h"]

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
