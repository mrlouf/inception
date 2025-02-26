#!/bin/bash

# Ensure environment variables are available
if [ -z "$SQL_ROOT_PASSWORD" ] || [ -z "$SQL_DATABASE" ] || [ -z "$SQL_USER" ] || [ -z "$SQL_PASSWORD" ]; then
  echo "One or more required environment variables are missing."
  exit 1
fi

# Debugging: Print environment variables
echo "SQL_ROOT_PASSWORD: $SQL_ROOT_PASSWORD"
echo "SQL_DATABASE: $SQL_DATABASE"
echo "SQL_USER: $SQL_USER"
echo "SQL_PASSWORD: $SQL_PASSWORD"

# Checks for volume and creates it if needed
[ ! -d "$HOME/data/mysql" ] && mkdir -p "$HOME/data/mysql"

service mysql start

# Wait for MariaDB to be ready
until mysqladmin ping --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done

# Try to connect without a password first
mysql -u root -e "SELECT 1;" > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Connected to MariaDB without password, setting root password..."
  mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
else
  echo "Connecting to MariaDB with root password..."
  mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "SELECT 1;" || { echo "MySQL connection failed"; exit 1; }
fi

# Execute SQL commands
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" || { echo "Failed to create database"; exit 1; }
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" || { echo "Failed to create user"; exit 1; }
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" || { echo "Failed to grant privileges"; exit 1; }
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;" || { echo "Failed to flush privileges"; exit 1; }

mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe