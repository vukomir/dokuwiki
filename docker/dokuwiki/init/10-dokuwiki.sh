#!/usr/bin/env bash

set -e

# Volumes Init
#
if [ ! -f /var/www/html/data/deleted.files ]; then
  echo "Init data folder"
  cp -R /opt/src/dokuwiki/data/* /var/www/html/data/
  cp -R /opt/src/dokuwiki/data/.htaccess /var/www/html/data/
  chown -R www-data /var/www/html/data
fi

if [ ! -f /var/www/html/conf/.htaccess ]; then
  echo "Init conf folder"
  cp -R /opt/src/dokuwiki/conf/* /var/www/html/conf/
  chown -R www-data /var/www/html/conf
fi

# Lib Init
#
if [ ! -f /var/www/html/lib/tpl/index.php ]; then
  echo "Init lib/tpl folder"
  cp -R /opt/src/dokuwiki/lib/tpl/* /var/www/html/lib/tpl/
  chown -R www-data /var/www/html/lib/tpl
fi

if [ ! -f /var/www/html/lib/plugins/index.html ]; then
  echo "Init lib/plugins folder"
  cp -R /opt/src/dokuwiki/lib/plugins/* /var/www/html/lib/plugins/
  chown -R www-data /var/www/html/lib/plugins
fi
