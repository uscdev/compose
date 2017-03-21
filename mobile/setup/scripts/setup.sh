#!/usr/bin/env bash
if [ ! -d "/var/www/html/php.ini" ]; then
    mv /scripts/php.ini /var/www/html/
    wp core install --url=https://mobile.usc.edu --title=USC-Gateway-for-Mobile --admin_user=wp-admin --admin_email=mobile@usc.edu --admin_password=${USC_MOBILE_ADMIN_PASSWORD}
    wp theme install --activate /workfiles/mobile-gateway.zip
    wp plugin install --activate /workfiles/usc-localist-for-wordpress.zip
    wp plugin install wordpress-importer --activate
    wp import --authors=create /workfiles/uscgatewayformobile.wordpress.xml
    wp rewrite structure '/%postname%/'
fi
