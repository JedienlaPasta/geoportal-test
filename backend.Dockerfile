# Imagen base
FROM python:3.10-slim

# Establecer directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema requeridas
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    poppler-utils \
    tesseract-ocr \
    tesseract-ocr-spa \
    && rm -rf /var/lib/apt/lists/*

# Crear el directorio /data para montar el volumen
RUN mkdir -p /data

# Instalar dependencias de python especificadas en requirements.txt
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el backend a la estructura del contenedor
COPY backend/ ./backend/

# Definir directorio de trabajo en backend
WORKDIR /app/backend

# Puerto
EXPOSE 8000

# Comando de inicio usando gunicorn
CMD ["gunicorn", "app_railway:app", "--bind", "0.0.0.0:8000", "--workers", "4", "--threads", "2", "--timeout", "300"]