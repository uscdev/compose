FROM mongo:latest
MAINTAINER dcorley@usc.edu

RUN apt-get update && apt-get install cron

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/backup-cron
ADD sbin/backup.sh.tpl /sbin/backup.sh.tpl
ADD sbin/startup.sh /sbin/startup.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/backup-cron
RUN chmod 0744 /sbin/startup.sh
RUN chmod a+x /sbin/startup.sh
RUN chmod 0644 /sbin/backup.sh.tpl
RUN chmod a+x /sbin/backup.sh.tpl

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

VOLUME ["/data/backup"]

# Run the command on container startup
# CMD cron && tail -f /var/log/cron.log
CMD /sbin/startup.sh
