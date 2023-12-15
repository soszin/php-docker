FROM php:8.3-fpm as base

WORKDIR /var/www

RUN apt-get update && apt-get install -y --no-install-recommends \
    nano vim \
    git \
    libzip-dev \
    unzip;

RUN set -eux; \
	docker-php-ext-install \
		zip \
	;

# Get latest Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY ./docker/phpfpm/docker-entrypoint.sh /docker-entrypoint
RUN chmod +x /docker-entrypoint
#
ENTRYPOINT ["/docker-entrypoint"]

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"