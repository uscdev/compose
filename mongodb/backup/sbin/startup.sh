#!/bin/bash -e

if [ "$BACKUP_CRON_EXP" = "" ]; then
    export BACKUP_CRON_EXP="0 4 * * *"
fi
if [ "$BACKUP_OUTPUT" = "" ]; then
    export BACKUP_OUTPUT="/data/backup"
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

# adapt cronjobs file
sed -i "s|{{ BACKUP_CRON_EXP }}|${BACKUP_CRON_EXP}|g" /etc/cron.d/backup-cron
rm -f /sbin/backup.sh
cp /sbin/backup.sh.tpl /sbin/backup.sh
chmod 0644 /sbin/backup.sh
chmod a+x /sbin/backup.sh

set +B
sed -i "s|\${BACKUP_OUTPUT}|${BACKUP_OUTPUT}|g" /sbin/backup.sh
sed -i "s|\${BACKUP_TTL}|${BACKUP_TTL}|g" /sbin/backup.sh
sed -i "s|\${MONGO_HOST}|${MONGO_HOST}|g" /sbin/backup.sh
sed -i "s|\${MONGO_PORT}|${MONGO_PORT}|g" /sbin/backup.sh
set -B

cron

while true; do
    sleep 60
    echo Wait again
done
