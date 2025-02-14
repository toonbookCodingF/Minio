# Use the official MinIO image
FROM minio/minio:latest

# Expose necessary ports
EXPOSE 9000 9001

# Create a volume for persistent storage
VOLUME ["/data"]

# Run MinIO with environment variables
CMD ["minio", "server", "/data", "--console-address", ":9001"]