FROM centos:latest

LABEL maintainer="prashantgaigol21@gmail.com"

RUN yum install -y httpd zip unzip \
    && yum clean all \
    && rm -rf /var/cache/yum

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/
RUN unzip photogenic.zip \
    && cp -rvf photogenic/* . \
    && rm -rf photogenic photogenic.zip

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
