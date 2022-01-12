FROM base
RUN apt update && apt install -yq --no-install-recommends 

EXPOSE 22
EXPOSE 3306 33060
#indicamos el timezone
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER root
RUN apt install -y mysql-server
COPY ./addhosts /root
COPY ./id_rsa.pub /root
COPY ./start.sh /root
COPY ./mysql.exp /root
COPY ./libreria.sql /root
RUN chmod +x /root/mysql.exp

RUN dos2unix /root/start.sh 
RUN chmod +x /root/start.sh
ENTRYPOINT [ "/root/start.sh" ]

