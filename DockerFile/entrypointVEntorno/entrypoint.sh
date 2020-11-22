#!/bin/bash
set -e

DB_NAME=${DB_NAME:-}
DB_USER=${DB_USER:-}
DB_PASS=${DB_PASS:-}


mkdir /root/prueba1
touch /root/prueba1/datos.txt
echo "probando" >> /root/prueba1/datos.txt
echo "argumentos/environment"
echo "--->${DB_NAME}" > /root/prueba1/datos.txt
echo "--->${DB_USER}" >> /root/prueba1/datos.txt
echo "--->${DB_PASS}" >> /root/prueba1/datos.txt
echo "param: $0 --> $1 -->$2 ---> $3" >> /root/prueba1/datos.txt
service apache2 start



