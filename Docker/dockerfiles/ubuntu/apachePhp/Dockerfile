FROM ub-base
RUN apt update && apt install -yq --no-install-recommends \
    software-properties-common
#indicamos el timezone
#ARG TZ=Europe/Madrid
ARG USUARIO
ARG PASSWD
ARG TZ
#ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./start-php.sh /root
RUN chmod +x /root/start-php.sh
RUN dos2unix /root/start-php.sh 

EXPOSE 80
#instalamos php
#RUN add-apt-repository ppa:ondrej/php 
RUN apt-get update && apt-get install -y php \
    php-cli \
    php-fpm \
    php-json \
    php-common \
    php-mysql \
    php-zip \
    php-gd \
    php-mbstring \
    php-curl \
    php-xml \
    php-pear \ 
    php-bcmath \
    apache2 

ENTRYPOINT [ "/root/start-php.sh" ]