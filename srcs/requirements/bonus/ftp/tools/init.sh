#!/bin/sh


echo  "Mandatory directory for vsftpd to run.."
mkdir -p /var/run/vsftpd/empty

# Alpine-specific user creation with fixed UID 1000
if ! id "$FTP_USER" >/dev/null 2>&1; then
    adduser -D -u 1000 -h /var/www/html -s /bin/sh $FTP_USER
    echo "$FTP_USER:$FTP_PWD" | chpasswd
fi


# 
# Permissions fix

# Ensure the root matches
echo "Fix permissions for the WordPress volume..."
chown -R 1000:1000 /var/www/html

# Run vsftpd in foreground
echo "Starting vsftpd on port 21..."
exec /usr/sbin/vsftpd /etc/vsftpd.conf



