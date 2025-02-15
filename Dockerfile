# Utiliser l'image officielle de MinIO
FROM minio/minio:latest

# Exposer un seul port pour l'API et la console
EXPOSE 9000

# Lancer MinIO avec l'API et la console via le même port
CMD ["minio", "server", "/data", "--address", "0.0.0.0:9000", "--console-address", ":9000"]
