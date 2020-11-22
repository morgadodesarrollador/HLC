#!/usr/bin/expect -f

MYSQL_ROOT_PASSWORD=usuario
service mysql start

set timeout -1
spawn mysql_secure_installation;
expect "*Would you like to setup VALIDATE PASSWORD*"
send -- "n\r" 
expect "*New password:*" 
send -- "usuario\r" 
expect "*Re-enter new password:*"         
send -- "usuario\r" 
expect "*Do you wish to continue with the password provided?*"
send -- "y\r"
expect "*Remove anonymous users?*"
send -- "y\r" 
expect "*Disallow root login remotely?*"
send -- "n\r"
expect "*Remove test database and access to it?*"
send -- "n\r"
expect "*Reload privilege tables now?*"
send -- "y\r"

expect eof

user            = mysql
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
port            = 3306
datadir         = /var/lib/mysql
skip-grant-tables