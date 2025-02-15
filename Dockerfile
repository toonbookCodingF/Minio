# Utiliser une image NGINX de base
FROM nginx:alpine

# Installer MinIO
RUN apk add --no-cache curl bash \
    && curl -Lo minio https://dl.min.io/server/minio/release/linux-amd64/minio \
    && chmod +x minio \
    && mv minio /usr/local/bin/

# Copier le fichier de configuration de NGINX
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer les ports nécessaires
EXPOSE 80 9000 9001

# Démarrer MinIO et NGINX
CMD minio server /data --address 0.0.0.0:9000 --console-address 0.0.0.0:9001 & nginx -g 'daemon off;'
