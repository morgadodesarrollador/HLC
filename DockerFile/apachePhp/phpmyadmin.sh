#!/usr/bin/expect -f

set timeout -1
puts "entra 1"
spawn apt-get install -y phpmyadmin;
expect "*Web server to reconfigure automatically:*"
send -- "1\r" 
puts "--> configure Web server"

expect "*Configure database for phpmyadmin with dbconfig-common?*"
send -- "yes\r" 
puts "--> configure database"

expect "*MySQL application password for phpmyadmin:*"         
send -- "usuario\r" 
puts "--> configure MySQL"

expect "*Password confirmation:*"         
send -- "usuario\r" 
puts "--> pass confirmation MySQL"

expect "*Password of the database's administrative user:*" 
send -- "usuario\r" 
puts "--> configure Password"

expect "*Next step for database installation:*" 
send -- "4\r" 
puts "--> ignore"


expect eof
