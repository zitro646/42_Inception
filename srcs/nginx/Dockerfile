#Getting base image
#NGIX

FROM debian:buster

RUN apt-get update && apt-get install -y nginx

#Eliminar directamente sites-enabled por tocar los huevos
RUN rm -rf /etc/nginx/sites-enabled/*

# Copiar archivo de configuración default.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Iniciar servicios
CMD ["nginx", "-g", "daemon off;"]