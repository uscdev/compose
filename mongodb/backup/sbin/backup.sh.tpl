#!/bin/bash -e

# Usage: /sbin/backup.sh

# source /container/run/environment.sh


# delete backups that are over $MMC_MAIL_BACKUP_TTL days
find ${BACKUP_OUTPUT} -type f -mtime +${BACKUP_TTL} -exec rm {} \;

# Date format for the dump file name
export MONGO_OUTPUT=${BACKUP_OUTPUT}/db
dateFileFormat="+%Y%m%dT%H%M%S"
backupFile=$(date "$dateFileFormat").tar.gz
backupFilePath="${BACKUP_OUTPUT}/$backupFile"

cd ${BACKUP_OUTPUT}
rm -fr db
mkdir -p db
mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} --out db

tar -czf $backupFile db
chmod 400 $backupFile
rm -f current.tar.gz
ln -s $backupFile current.tar.gz

exit 0
