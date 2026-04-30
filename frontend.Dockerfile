# Imagen base
FROM nginx:alpine

# Configuración del proxy
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Contenido de la carpeta frontend
COPY frontend/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]