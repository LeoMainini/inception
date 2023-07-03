FROM debian
RUN apt-get -y update && apt-get -y install nginx
COPY text.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/
EXPOSE 443
#CMD ["/usr/sbin/nginx", "-h"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
