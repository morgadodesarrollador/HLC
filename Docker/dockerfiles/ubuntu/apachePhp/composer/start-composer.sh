#!/bin/bash

bash /root/start-php.sh

yum update -y

php -r "copy('https://getcomposer.org/installer', '/root/composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', '/root/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/root/composer-setup.php'); } echo PHP_EOL;"
php /root/composer-setup.php --install-dir=/usr/local/bin --filename=composer
chmod +x /usr/local/bin/composer

echo "Imagen composer terminada"

if ! [ -f /root/start-laravel.sh ]
 then
    php-fpm -F -R
fi