#!/bin/bash

DATE=$(date +"%Y%m%d%H%M%S")
REDIS_BACKUP_DIR="/home/yourusername/redis_backups" # Replace with your username

mkdir -p "$REDIS_BACKUP_DIR"
cp /var/lib/redis/dump.rdb "$REDIS_BACKUP_DIR/dump_$DATE.rdb"

echo "Redis backup completed: $REDIS_BACKUP_DIR/dump_$DATE.rdb"
