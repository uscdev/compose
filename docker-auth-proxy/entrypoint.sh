#!/bin/bash

if test -z "${CA_CRT}"; then
    echo "Error: CA certificate must be supplied using environment variable CA_CRT."
    exit 1
fi
if test -z "${SERVER_KEY}"; then
    echo "Error: Server private key must be supplied using environment variable SERVER_KEY."
    exit 1
fi
if test -z "${SERVER_CRT}"; then
    echo "Error: Server certificate must be supplied using environment variable SERVER_CRT."
    exit 1
fi

mkdir -p /etc/nginx/certs
cat "${CA_CRT}" > /etc/nginx/certs/ca.pem
cat "${SERVER_KEY}" > /etc/nginx/certs/server-key.pem
cat "${SERVER_CRT}" > /etc/nginx/certs/server-cert.pem