#!/bin/bash

COMPOSER_GLOBAL_DIR=/usr/local/bin/composer-global

apt-get update
apt-get -y install \
    php5-cli php5-curl php5-intl php5-mysql php5-xsl \
    git zsh \
    cifs-utils

if [ ! -x /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
fi

mkdir $COMPOSER_GLOBAL_DIR
composer \
    --no-interaction --prefer-dist --update-no-dev \
    --working-dir=$COMPOSER_GLOBAL_DIR \
    require \
    phing/phing \
    phpunit/phpunit
