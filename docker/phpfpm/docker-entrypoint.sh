#!/bin/sh

set -e

if [ ! -f composer.json ]; then
  rm -Rf tmp/
  composer create-project symfony/skeleton:"7.0.*" tmp

  cd tmp
  cp -Rpa . ..
  cd ..
  rm -Rf tmp/
fi


if [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then
  composer install --prefer-dist --no-progress --no-interaction
fi

chown -R ${USER}:${USER} /var/www/

php-fpm