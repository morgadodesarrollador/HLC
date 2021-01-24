#!/bin/bash
set -e


config_hosts(){
    echo  ${HOSTNAME} > /etc/hostname
    cat /root/addhosts >> /etc/hosts
    #hostname ${HOSTNAME}
    IP_SBD=`cat /etc/hosts | grep SBD | cut -d " " -f1`
}

newUser(){
    # ---------------- creación de usuario 
    echo "MAQ2-->usuarioBD-->${USUARIO}" > /root/datos.txt
    useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 
    echo "root:${PASSWD}" | chpasswd
    echo "${USUARIO}:${PASSWD}" | chpasswd
}

config_Sudoers(){
    echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
}

config_ssh(){
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
    if [ ! -d /home/${USUARIO}/.ssh ]
    then
        mkdir /home/${USUARIO}/.ssh
        cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
    fi
    /etc/init.d/ssh start
}

config_apache(){
    #sed -i "s/\${APACHE_RUN_USER}/\www-data/g" /etc/apache2/apache2.conf
    #sed -i "s/${APACHE_RUN_DIR}/$/g" /etc/apache2/apache2.conf
    #asocia las variables del apache2.conf con los valores definidos en /etc/apache2/envars
    source /etc/apache2/envvars
    # con apache2 -S veremos los valores del las variables asociadas

    # Apache gets grumpy about PID files pre-existing
    #rm -f /var/run/apache2/apache2.pid
}

config_phpmyadmin(){
    expect -f /root/phpmyadmin.exp
    ln -sf /usr/share/phpmyadmin /var/www/phpmyadmin
    sed -i "s/\$dbuser=''/\$dbuser='${USUARIO}'/g" /etc/phpmyadmin/config-db.php 
    sed -i "s/\$dbpass=''/\$dbpass='${USUARIO}'/g" /etc/phpmyadmin/config-db.php 
    sed -i "s/\$dbname='phpmyadmin'/\$dbname=''/g" /etc/phpmyadmin/config-db.php     
    sed -i "s/\$dbserver='localhost'/\$dbserver='${IP_SBD}'/g" /etc/phpmyadmin/config-db.php     
    sed -i "s/localhost/${IP_SBD}/g" /usr/share/phpmyadmin/libraries/config.default.php
}
config_laravel(){
    cd /var/www/html
    export COMPOSER_HOME="$HOME/.config/composer";
   #composer create-project laravel/laravel "${PROYECTO}" --prefer-dist

    chgrp -R www-data "/var/www/html/${PROYECTO}"
    chmod g+w -R "/var/www/html/${PROYECTO}"

    RUTA_env=/var/www/html/${PROYECTO}/api${PROYECTO}/.env
    echo "-->". ${RUTA_env}
    sed -i "s/DB_HOST=127.0.0.1/DB_HOST=${IP_SBD}/g" ${RUTA_env}
    sed -i "s/DB_DATABASE=jardineria/DB_DATABASE=${PROYECTO}/g" ${RUTA_env}
    sed -i "s/DB_USERNAME=root/DB_USERNAME=${USUARIO}/g" ${RUTA_env}
    sed -i "s/DB_PASSWORD=/DB_PASSWORD=${PASSWD}/g" ${RUTA_env}
}
#http://93.189.90.186/Jardineria/apiJardineria/public/index.php/api/admin/usuarios

config_git(){
    cd /var/www/html
    export COMPOSER_HOME="$HOME/.config/composer";
    if [ ! -d  /var/www/html/.git/ ];
    then 
        echo "no existe .git"
        git init
        git remote add origin https://github.com/morgadodesarrollador/IAW.git
        git checkout -b master
        git config core.sparseCheckout true
        echo "${PROYECTO}/api${PROYECTO}" >> .git/info/sparse-checkout
    fi
    #rm -rf ./git
    
    git pull origin master
    #cd ${PROYECTO}/api${PROYECTO}
    cd ${PROYECTO}/api${PROYECTO}
    composer update
    #instalamos librerías
}


main(){
    config_hosts
    newUser
    config_Sudoers
    config_ssh
    config_apache
    config_phpmyadmin
    config_git
    config_laravel
}



main


# Start Apache in foreground
/usr/sbin/apache2 -DFOREGROUND


