#!/bin/sh

# Check if the FTP user already exists
if id "$FTP_USER" &>/dev/null; then
    echo "User $FTP_USER already exists"
else
    # Create FTP user and set password
    adduser -D -h /home/vsftpd $FTP_USER
    echo "$FTP_USER:$FTP_PASS" | chpasswd
    echo "User $FTP_USER created"
fi

# Ensure necessary directories exist
mkdir -p /var/run/vsftpd/empty

# Start vsftpd
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf