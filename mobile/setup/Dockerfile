#
# Most of this content comes from conetix/docker-wordpress-wp-cli. Thanks!
# Installs WordPress with wp-cli (wp.cli.org) installed
# And executes the setup script

FROM wordpress:latest

# Add sudo in order to run wp-cli as the www-data user 
RUN apt-get update && apt-get install -y sudo less git

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY scripts/wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY workfiles /workfiles
COPY scripts /scripts

CMD ["bash","/scripts/setup.sh"]