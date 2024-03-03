#!/bin/bash

DATE=$(date +"%Y%m%d%H%M%S")
MYSQL_BACKUP_DIR="/home/ubuntu/mysql_backups"
MYSQL_USER="your_mysql_username"
MYSQL_PASSWORD="your_mysql_password"
DATABASES=("database1")

mkdir -p "$MYSQL_BACKUP_DIR"
MYSQL_CONFIG_FILE=$(mktemp)
echo "[mysqldump]" > "$MYSQL_CONFIG_FILE"
echo "user=$MYSQL_USER" >> "$MYSQL_CONFIG_FILE"
echo "password=$MYSQL_PASSWORD" >> "$MYSQL_CONFIG_FILE"

for DB_NAME in "${DATABASES[@]}"; do
    mysqldump --defaults-extra-file="$MYSQL_CONFIG_FILE" "$DB_NAME" > "$MYSQL_BACKUP_DIR/$DB_NAME-$DATE.sql"
done

rm "$MYSQL_CONFIG_FILE"

echo "MySQL backup completed: $MYSQL_BACKUP_DIR"
