FROM apache/php
RUN apt update && apt install -yq --no-install-recommends \
    openssh-server \
    openssh-client \
    sudo \
    apache2 \
    mysql-client
   # phpmyadmin 

EXPOSE 80
EXPOSE 22

COPY ./addhosts /root
COPY ./id_rsa.pub /root
COPY ./start.sh /root
COPY ./phpmyadmin.exp /root

RUN dos2unix /root/phpmyadmin.exp 
RUN chmod +x /root/phpmyadmin.exp

RUN dos2unix /root/start.sh 
RUN chmod +x /root/start.sh
ENTRYPOINT [ "/root/start.sh" ]

