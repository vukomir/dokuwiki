FROM ubuntu:16.04

MAINTAINER Vucomir Ianculov <vukomir@ianculov.ro>

# Install Packages
#
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y wget apache2 php-gd php-ldap php-curl php-xml php-mbstring libapache2-mod-php

# Configure dokuwiki
#
RUN wget -q -O /tmp/dokuwiki.tgz https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
RUN tar -zxf /tmp/dokuwiki.tgz -C /var/www/html --strip-components 1
RUN mkdir -p /opt/src/dokuwiki && tar -zxf /tmp/dokuwiki.tgz -C /opt/src/dokuwiki --strip-components 1
RUN chown -R www-data:www-data /var/www/html

# Configure apache vhost
#
ADD docker/dokuwiki/config/000-default.conf /etc/apache2/sites-available/000-default.conf

# Enabeling apache modules
#
RUN /usr/sbin/a2enmod rewrite

#Clean apt
#
RUN apt-get -y clean \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

#Setup docker
ADD docker/dokuwiki/init /init
ADD docker/docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /var/www/html

EXPOSE 80
VOLUME ["/var/www/html/data","/var/www/html/conf","/var/www/html/lib/tpl","/var/www/html/lib/plugins"]

ENTRYPOINT ["/docker-entrypoint.sh"]
