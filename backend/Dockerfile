FROM alpine:latest AS build

# Ez lesz az appunk alapértelmezett könyvtára
WORKDIR /api-source

# Mindent bemásolunk az konténerbe
COPY . /api-source

# ebből fogunk buildelni
# COPY ./composer.* /api-source

# Behúzzuk a megfelelő PHP alapkonténerünket
FROM ratkaiga/php8.5-rg-dev:1.0.1 AS dev

# mindent másolunk az api-source könyvtárból az app alapértelmezett könyvtárába
COPY --from=build /api-source /app

# felülírjuk a php.ini-t minden változatnál (cgi, cli, fpm)
COPY ./php-ini-overrides.ini /etc/php/8.5/cgi/conf.d/
COPY ./php-ini-overrides.ini /etc/php/8.5/cli/conf.d/
COPY ./php-ini-overrides.ini /etc/php/8.5/fpm/conf.d/

# az entrypointra bízzuk a továbbiakat
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
