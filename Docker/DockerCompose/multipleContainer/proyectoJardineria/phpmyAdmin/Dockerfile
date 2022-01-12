FROM apache-php
RUN apt update && apt install -yq --no-install-recommends \
    mysql-client 
   # phpmyadmin 

#EXPOSE 80
EXPOSE 22

COPY ./addhosts /root
COPY ./id_rsa.pub /root
COPY ./start.sh /root
COPY ./phpmyadmin.exp /root

RUN dos2unix /root/phpmyadmin.exp 
RUN chmod +x /root/phpmyadmin.exp

RUN dos2unix /root/start.sh 
RUN chmod +x /root/start.sh

#---------- instalamos composer --------------------
WORKDIR /var/www/html
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

ENTRYPOINT [ "/root/start.sh" ]

