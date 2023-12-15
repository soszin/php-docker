#!/bin/sh

set -e

if [ ! -f src/composer.json ]; then
  rm -Rf tmp/
  composer create-project symfony/skeleton:"7.0.*" src

#  cd tmp
#  cp -Rpa . ..
#  cd ..
#  rm -Rf tmp/
fi


if [ -z "$(ls -A 'src/vendor/' 2>/dev/null)" ]; then
  composer install --prefer-dist --no-progress --no-interaction
fi

php-fpm