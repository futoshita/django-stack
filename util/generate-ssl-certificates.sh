#!/bin/bash

openssl req -x509 -out traefik.crt -keyout traefik.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=traefik' -extensions EXT -config <( \
   printf "[dn]\nCN=traefik\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:traefik\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")