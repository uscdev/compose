#!/bin/bash -e

# Usage: /sbin/backup.sh

# source /container/run/environment.sh

if [ "$BACKUP_OUTPUT" = "" ]; then
    export BACKUP_OUTPUT="/data/backup/"
fi
if [ "$BACKUP_TTL" = "" ]; then
    export BACKUP_TTL="15"
fi
if [ "$MONGO_HOST" = "" ]; then
    export MONGO_HOST="mongo"
fi
if [ "$MONGO_PORT" = "" ]; then
    export MONGO_PORT="27017"
fi

# delete backups that are over $MMC_MAIL_BACKUP_TTL days
find $BACKUP_OUTPUT -type f -mtime +$BACKUP_TTL -exec rm {} \;

# Date format for the dump file name
export MONGO_OUTPUT=${BACKUP_OUTPUT}/db
dateFileFormat="+%Y%m%dT%H%M%S"
backupFilePath="$BACKUP_OUTPUT/$(date "$dateFileFormat").tar.gz"

rm -fr ${MONGO_OUTPUT}
mkdir -p ${MONGO_OUTPUT}
mongodump --host $MONGO_HOST --port $MONGO_PORT --out ${MONGO_OUTPUT}

tar -czf $backupFilePath ${MONGO_OUTPUT}
chmod 600 $backupFilePath
ln -s $backupFilePath
ln -s $backupFilePath $BACKUP_OUTPUT/current.tar.gz

exit 0
