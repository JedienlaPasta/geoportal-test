FROM nginx:alpine

# Copiamos la configuración del proxy
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiamos solo el contenido de la carpeta frontend [cite: 243]
COPY frontend/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]