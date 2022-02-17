FROM base
RUN apt update && apt install -yq --no-install-recommends   

EXPOSE 22

COPY ./id_rsa.pub /root
COPY ./start.sh /root

RUN dos2unix /root/start.sh 
RUN chmod +x /root/start.sh


ENTRYPOINT [ "/root/start.sh" ]

