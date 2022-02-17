#!/bin/bash
set -e

echo "${PROYECTO}" > datos.txt
composer create-project laravel/laravel "${PROYECTO}" --prefer-dist

chgrp -R www-data "${PROYECTO}"
chmod 775 -R "${PROYECTO}"

echo "echo '<h1>proyecto ${PROYECTO}</h1>';" >> ${PROYECTO}/public/index.php

#sed -i "s/\${APACHE_RUN_USER}/\www-data/g" /etc/apache2/apache2.conf
#sed -i "s/${APACHE_RUN_DIR}/$/g" /etc/apache2/apache2.conf

#asocia las variables del apache2.conf con los valores definidos en /etc/apache2/envars
source /etc/apache2/envvars
# con apache2 -S veremos los valores del las variables asociadas

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

# Start Apache in foreground
/usr/sbin/apache2 -DFOREGROUND


