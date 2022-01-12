#!/bin/bash

bash /root/start-composer.sh

webPath=/var/www/html

cd $webPath

if [ -f $webPath/custom_404.html ]
 then
    mv $webPath/custom_404.html /usr/tmp/custom_404.html
fi

if [ -f $webPath/50x.html ]
 then
    mv $webPath/50x.html /usr/tmp/50x.html
fi

if ! [ -f $webPath/composer.json ]
 then
    if [ "$GITHUB" != "" ]
     then
        if ! [ -d .git ]
         then
            git init
            git remote add origin ${GITHUB}
        fi
        cd $webPath
        git pull origin master
    else
        rm -rf $webPath
        mkdir $webPath
        composer create-project laravel/laravel .
    fi
else
    if [ "$GITHUB" != "" ]
     then
        if ! [ -d .git ]
         then
            git init
            git remote add origin ${GITHUB}
        fi
        git pull origin master
    fi
fi

composer install
php artisan key:generate
php artisan config:cache

if ! [ -f $webPath/public/custom_404.html ]
 then
    mv /usr/tmp/custom_404.html $webPath/public/custom_404.html
else
    rm /usr/tmp/custom_404.html
fi

if ! [ -f $webPath/public/50x.html ]
 then
    mv /usr/tmp/50x.html $webPath/public/50x.html
else
    rm /usr/tmp/50x.html
fi

if [ -d $webPath/storage ]
 then
    chown -R :nginx $webPath/storage
    chmod -R 777 $webPath/storage
fi

if [ -d $webPath/bootstrap/cache ]
 then
    chown -R :nginx $webPath/bootstrap/cache
    chmod -R 775 $webPath/bootstrap/cache
fi

echo "Imagen Laravel terminada"

php-fpm -F -R