FROM alpine:3.21


RUN apk add --no-cache vsftpd dos2unix linux-pam

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN printf "auth required pam_unix.so\naccount required pam_unix.so\n" > /etc/pam.d/vsftpd

COPY tools/init.sh /usr/local/bin/setup.sh
RUN dos2unix /usr/local/bin/setup.sh && chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]


