# Utiliser l'image officielle MinIO
FROM minio/minio:latest

# Installer NGINX
RUN apt-get update && apt-get install -y nginx

# Copier le fichier de configuration NGINX dans l'image Docker
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer les ports nécessaires
EXPOSE 80 9000 9001

# Lancer MinIO en arrière-plan, puis démarrer NGINX en avant-plan
CMD minio server /data --address 0.0.0.0:9000 --console-address 0.0.0.0:9001 & nginx -g 'daemon off;'
