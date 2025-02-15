# Utiliser une image de base NGINX
FROM nginx:alpine

# Copier le fichier de configuration NGINX
COPY nginx.conf /etc/nginx/nginx.conf

# Télécharger MinIO
FROM minio/minio:latest

# Exposer les ports 9000 (API) et 9001 (console)
EXPOSE 9000 9001

# Lancer MinIO (sans exposer directement les ports) et NGINX en parallèle
CMD ["sh", "-c", "minio server /data --address 0.0.0.0:9000 --console-address 0.0.0.0:9001 & nginx -g 'daemon off;'"]
