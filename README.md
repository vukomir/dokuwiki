DokuWiki docker container
=========================

To run image:
-------------

	docker run -d -p 80:80 --name dokuwiki.app vukomir/dokuwiki 

You can now visit the install page to configure your new DokuWiki wiki.

if you are running container locally, you can acces the page 
in browser by going to http://127.0.0.1/install.php

### Run with bind mounts ###

The run command above will store your data in internal Docker volumes. If you prefer to bind mount directories on your file system, then you can use the `-v` parameter, for example:

    docker run -d -p 80:80 --name dokuwiki.app \
        -v /app/dokuwiki/data:/var/www/html/data \
        -v /app/dokuwiki/conf:/var/www/html/conf \
        -v /app/dokuwiki/lib/plugins:/var/www/html/lib/plugins \
        -v /app/dokuwiki/lib/tpl:/var/www/html/lib/tpl \
        vukomir/dokuwiki

Optimizing your wiki
--------------------

Apache is configured with mod_rewrites, so you can enable 
nice URLs in settings (Advanced -> Nice URLs, set to ".htaccess")
