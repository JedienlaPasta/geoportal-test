FROM nginx:alpine
# Copia el contenido de la carpeta frontend al directorio por defecto de Nginx
COPY . /usr/share/nginx/html
# Exponemos el puerto 80 del contenedor
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]