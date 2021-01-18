FROM apache/php
RUN apt update && apt install -yq --no-install-recommends \
    curl \
    unzip \
    dos2unix

WORKDIR /var/www/html
COPY ./entrypoint.sh /var/www/html
RUN chmod +x /var/www/html/entrypoint.sh
RUN dos2unix /var/www/html/entrypoint.sh

EXPOSE 80

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
ENTRYPOINT [ "/var/www/html/entrypoint.sh" ]
