#Getting base image
#NGIX

FROM debian:buster

RUN apt-get update && apt-get install -y nginx


# Copiar archivo de configuración nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf


# necesita esto para establecer la web -> /etc/init.d/php7.3-fpm start
CMD ["sh","/etc/init.d/nginx restart"]

# Iniciar servicios
CMD ["nginx", "-g", "daemon off;"]