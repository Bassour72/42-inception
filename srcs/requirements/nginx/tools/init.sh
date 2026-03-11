#!/bin/sh

# Check if environment variables are set
if [ -n "$CADVISOR_USER" ] && [ -n "$CADVISOR_PWD" ]; then
    echo "Creating .htpasswd for $CADVISOR_USER..."
    # -c creates the file, -b enables batch mode for passwords
    htpasswd -bc /etc/nginx/.htpasswd "$CADVISOR_USER" "$CADVISOR_PWD"
else
    echo "CADVISOR_USER or CADVISOR_PWD not set. Skipping auth setup."
fi

# Start NGINX in the foreground
nginx -g 'daemon off;'
