# Dockerfile
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the installation script
COPY easy-install.py /app/easy-install.py
RUN chmod +x /app/easy-install.py

# Set default environment variables
ENV PROJECT_NAME=frappe \
    SITES=site1.localhost \
    ADMIN_EMAIL=admin@example.com \
    ERPNEXT_VERSION=stable \
    INSTALL_APPS=learning \
    HTTP_PORT=8080

EXPOSE 8080

# Entry point script
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
