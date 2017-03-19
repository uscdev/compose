#!/usr/bin/env bash
if [ ! -d "/var/www/html/php.ini" ]; then
    mv /scripts/php.ini /var/www/html/
    wp core install --url=http://mobile.usc.edu --title=USC_Gateway_for_Mobile --admin_user=wp-admin --admin_email=mobile@usc.edu --admin_password=${USC_MOBILE_ADMIN_PASSWORD}
    wp theme install --activate /workfiles/mobile-gateway.zip
    rm -f /workfiles/mobile-gateway.zip
    wp plugin install --activate /workfiles/usc-localist-for-wordpress.zip
    rm -f /workfiles/usc-localist-for-wordpress.zip
    wp plugin install wordpress-importer --activate
    wp import --authors=create /workfiles/uscgatewayformobile.wordpress.xml
    rm -f /workfiles/uscgatewayformobile.wordpress.xml
fi