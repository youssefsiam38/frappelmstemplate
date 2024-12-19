# docker-entrypoint.sh
#!/bin/bash
set -e

# Deploy Frappe
python3 /app/easy-install.py deploy \
    --project=${PROJECT_NAME} \
    --email=${ADMIN_EMAIL} \
    --sitename=${SITES} \
    --version=${ERPNEXT_VERSION} \
    --app=${INSTALL_APPS} \
    --no-ssl \
    --http-port=${HTTP_PORT}

# Keep container running
tail -f /dev/null
