#!/bin/bash -eux

PASSWORD="password123"
SUBJECT="/C=BR/ST=Sao_Paulo/O=Telefonica/CN=*.maas"
DAYS="$((365 * 10 ))"
DAYSCA="$((365 * 50))"
KEYSIZE="4096"
 
mkdir -p demoCA/newcerts
touch demoCA/index.txt
touch demoCA/index.txt.attr

openssl genrsa -passout pass:${PASSWORD} -des3 -out demoCA/issuing_ca_key.pem ${KEYSIZE}
openssl req -x509 -passin pass:${PASSWORD} -new -nodes -key demoCA/issuing_ca_key.pem \
    -config /etc/ssl/openssl.cnf \
    -subj ${SUBJECT} \
    -days ${DAYSCA} \
    -out demoCA/issuing_ca.pem
 
openssl genrsa -passout pass:${PASSWORD} -des3 -out demoCA/controller_ca_key.pem ${KEYSIZE}
openssl req -x509 -passin pass:${PASSWORD} -new -nodes \
    -key demoCA/controller_ca_key.pem \
    -config /etc/ssl/openssl.cnf \
    -subj ${SUBJECT} \
    -days ${DAYSCA} \
    -out demoCA/controller_ca.pem
 
openssl req \
    -newkey rsa:${KEYSIZE} -nodes -keyout demoCA/controller_key.pem \
    -subj ${SUBJECT} \
    -out demoCA/controller.csr
openssl ca -passin pass:${PASSWORD} -config /etc/ssl/openssl.cnf \
    -cert demoCA/controller_ca.pem -keyfile demoCA/controller_ca_key.pem \
    -create_serial -batch \
    -in demoCA/controller.csr -days ${DAYS} -out demoCA/controller_cert.pem
 
cat demoCA/controller_cert.pem demoCA/controller_key.pem > demoCA/controller_cert_bundle.pem

echo "You can now copy [ controller_ca.pem controller_ca_key.pem controller_cert_bundle.pem ] to your secrets dir"


