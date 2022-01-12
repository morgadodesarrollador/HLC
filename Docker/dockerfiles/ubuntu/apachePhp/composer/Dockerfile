FROM adrxking_centos-php

# Copiar script de inicio al root
COPY ./start-composer.sh /root

# Dar permisos de ejecución al script de inicio
RUN chmod +x /root/start-composer.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-composer.sh

ENTRYPOINT [ "/root/start-composer.sh" ]