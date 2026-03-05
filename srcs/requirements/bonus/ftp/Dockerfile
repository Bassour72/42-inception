FROM alpine:3.21

# 1. Install vsftpd, tools, and PAM support
RUN apk add --no-cache vsftpd dos2unix linux-pam

# 2. Create the config file (or COPY it if you have it locally)
# If you have a local file, use: COPY conf/vsftpd.conf /etc/vsftpd.conf
# This ensures vsftpd has its instructions.
COPY conf/vsftpd.conf /etc/vsftpd.conf

# 3. Fix for Alpine PAM authentication (vsftpd needs this to check passwords)
RUN printf "auth required pam_unix.so\naccount required pam_unix.so\n" > /etc/pam.d/vsftpd

# 4. Prepare the setup script
COPY tools/init.sh /usr/local/bin/setup.sh
RUN dos2unix /usr/local/bin/setup.sh && chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]


