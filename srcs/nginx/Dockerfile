FROM debian
RUN apt-get -y update && apt-get -y install nginx
COPY text.html /usr/share/nginx/html
EXPOSE 433
#CMD ["/usr/sbin/nginx", "-h"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
