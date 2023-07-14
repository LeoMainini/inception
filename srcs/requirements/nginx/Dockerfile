FROM debian:12
RUN apt-get -y update && apt-get -y install nginx wget libnss3-tools 
RUN rm -f /etc/nginx/sites-enabled/default
COPY tools/nginx.conf /etc/nginx
COPY tools/php.conf /etc/nginx/conf.d
COPY tools/init-certs.sh init-certs.sh
EXPOSE 443
ENTRYPOINT [ "sh" , "init-certs.sh" ]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
