#!/bin/sh

# Check if the FTP user already exists
if id "$FTP_USER" &>/dev/null; then
    echo "User $FTP_USER already exists"
else
    # Create system user
    adduser -D -h /home/$FTP_USER $FTP_USER
    echo "$FTP_USER:$FTP_PASS" | chpasswd
    
    # Verify user was created successfully
    if id "$FTP_USER" &>/dev/null; then
        echo "✅ User $FTP_USER created successfully"
        echo "User details: $(id $FTP_USER)"
    else
        echo "❌ Failed to create user $FTP_USER"
        exit 1
    fi
fi

# Ensure proper ownership and permissions for user directory
mkdir -p /home/$FTP_USER
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
chmod 755 /home/$FTP_USER

# Create PureDB file for authentication
mkdir -p /etc/pure-ftpd/auth
# Create Pure-FTPd user (this creates the passwd file)
echo "Creating Pure-FTPd user..."
pure-pw useradd $FTP_USER -u $FTP_USER -d /home/$FTP_USER -m <<EOF
$FTP_PASS
$FTP_PASS
EOF

# Verify Pure-FTPd user was created
if [ $? -eq 0 ]; then
    echo "✅ Pure-FTPd user $FTP_USER created successfully"
else
    echo "❌ Failed to create Pure-FTPd user $FTP_USER"
    exit 1
fi

# Generate the PureDB database
mkdir -p /opt/local/etc/pure-ftpd/pdb
pure-pw mkdb /opt/local/etc/pure-ftpd/pdb/pureftpd.pdb

# Create data directory with proper permissions
mkdir -p /var/ftp-data
chown -R $FTP_USER:$FTP_USER /var/ftp-data
chmod 755 /var/ftp-data

# Start Pure-FTPd
exec /usr/sbin/pure-ftpd -S 2121 -l puredb:/opt/local/etc/pure-ftpd/pdb/pureftpd.pdb -E -j -R -P $PASV_ADDRESS -p $PASV_MIN_PORT:$PASV_MAX_PORT