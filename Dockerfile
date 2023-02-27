FROM mediawiki:1.39.2

RUN set -eux; \
        \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                ghostscript \
                xpdf-utils \
        ;

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini; \
    sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g;s/post_max_size = 8M/post_max_size = 20M/g' /usr/local/etc/php/php.ini; \
    # set suggested file/directory permissions
    chown -R 1000:1000 . ;\
    chmod -R go-w . ;\
    chown -R www-data:www-data extensions skins cache images \
    ;
