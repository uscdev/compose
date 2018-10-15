#!/bin/bash -e

if [ "$BACKUP_CRON_EXP" = "" ]; then
    export BACKUP_CRON_EXP="0 4 * * *"
fi

# adapt cronjobs file
sed -i "s|{{ BACKUP_CRON_EXP }}|${BACKUP_CRON_EXP}|g" /etc/cron.d/backup-cron

cron

while true; do
    sleep 60
    echo Wait again
done
