# Utiliser l'image officielle de MinIO
FROM minio/minio:latest

# Exposer les ports API (9000) et Console (9001)
EXPOSE 9000 9001

# Définir un volume pour stocker les fichiers
VOLUME ["/data"]

# Lancer MinIO avec l'API et la Console
CMD ["minio", "server", "/data", "--address", "0.0.0.0:9000", "--console-address", "0.0.0.0:9001"]
