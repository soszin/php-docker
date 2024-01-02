FROM php:8.3-fpm as base

ARG USER=www
ARG UID=1000
ARG GID=1000

ENV USER ${USER}

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

RUN groupadd --force -g ${GID} ${USER}
RUN useradd -ms /bin/bash --no-user-group -g ${GID} -u ${UID} ${USER}

COPY ./docker/phpfpm/docker-entrypoint.sh /docker-entrypoint
RUN chmod +x /docker-entrypoint

ENTRYPOINT ["/docker-entrypoint"]