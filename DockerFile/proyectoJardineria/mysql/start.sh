#!/bin/bash
set -e

config_hosts(){
    echo  ${HOSTNAME} > /etc/hostname
    cat /root/addhosts >> /etc/hosts
    #hostname ${HOSTNAME}
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
    #/usr/sbin/mysqld --daemonize --pid-file=/run/mysqld/mysqld.pid &
}

config_Mysql(){
    sed -i 's/# pid-file/pid-file/' /etc/mysql/mysql.conf.d/mysqld.cnf
    sed -i 's/# socket/socket/' /etc/mysql/mysql.conf.d/mysqld.cnf
    sed -i 's/# port/port/' /etc/mysql/mysql.conf.d/mysqld.cnf
    sed -i 's/# datadir/datadir/' /etc/mysql/mysql.conf.d/mysqld.cnf
    sed -i 's/= 127.0.0.1/= 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

    mkdir /var/run/mysqld 
    chown -R mysql:mysql /var/run/mysqld

    /etc/init.d/mysql start
    expect /root/mysql.exp
    /etc/init.d/mysql restart

    echo "CREATE USER '${USUARIO}'@'%' IDENTIFIED BY '${PASSWD}';" > /root/user.sql
    echo "GRANT ALL PRIVILEGES ON *.* TO '${USUARIO}'@'%' WITH GRANT OPTION;" >> /root/user.sql
    echo "FLUSH PRIVILEGES;" >> /root/user.sql
    mysql -u root < /root/user.sql
}

main (){
    config_hosts
    newUser
    config_Sudoers
    config_ssh
    config_Mysql
    tail -f /dev/null
}

main