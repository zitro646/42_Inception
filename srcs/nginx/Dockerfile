#NGIX
FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=42_student/CN=mortiz-d.42.fr" \
            -newkey rsa:4096 -keyout /etc/ssl/private/public.key -out /etc/ssl/certs/certificate.crt -sha256

#Eliminar directamente sites-enabled por tocar los huevos
RUN rm -rf /etc/nginx/sites-enabled/*

# Copiar archivo de configuración default.conf
COPY ./tools/default.conf /etc/nginx/conf.d/default.conf

# Iniciar servicios
CMD ["nginx", "-g", "daemon off;"]