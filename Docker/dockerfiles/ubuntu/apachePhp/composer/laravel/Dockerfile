FROM adrxking_centos-php-composer

ARG GITHUB

# Copiar script de inicio al root
COPY ./start-laravel.sh /root

# Dar permisos de ejecución al script de inicio
RUN chmod +x /root/start-laravel.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-laravel.sh

EXPOSE 9000

ENTRYPOINT [ "/root/start-laravel.sh" ]