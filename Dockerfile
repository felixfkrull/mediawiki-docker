FROM mediawiki:1.33.1

RUN set -eux; \
        \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                ghostscript \
                xpdf-utils \
        ;
