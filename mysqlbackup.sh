#!/bin/bash

DATE=$(date +"%Y%m%d%H%M%S")
MYSQL_BACKUP_DIR="$HOME/mysql_backups"
MYSQL_USER="your_mysql_username"
MYSQL_PASSWORD="your_mysql_password"
DATABASES=("database1")

mkdir -p "$MYSQL_BACKUP_DIR"

for DB_NAME in "${DATABASES[@]}"; do
    mysqldump -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB_NAME" > "$MYSQL_BACKUP_DIR/$DB_NAME-$DATE.sql"
done

echo "MySQL backup completed: $MYSQL_BACKUP_DIR"
