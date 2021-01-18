FROM apache/php
RUN apt update && apt install -yq --no-install-recommends 

WORKDIR /root
COPY ./entrypoint.sh /root
RUN chmod +x /root/entrypoint.sh
ARG DB_NAME
ENTRYPOINT [ "/root/entrypoint.sh" ]

CMD ["argumento1", "argumento2", "argumento3"]
