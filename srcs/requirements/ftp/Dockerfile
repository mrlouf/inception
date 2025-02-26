FROM alpine:3.7

RUN apk update && apk add vsftpd

# Copy the script
COPY ./tools/ftp.sh /usr/local/bin/ftp.sh

# Configure vsftpd
COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010

CMD ["/usr/local/bin/ftp.sh"]