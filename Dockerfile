# Use the latest WordPress image with PHP 8.2
FROM wordpress:6.4-php8.2-apache

# Install additional packages
RUN apt-get update && apt-get install -y magic-wormhole

# Set up permissions
RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www/html

# Switch to root user for the initial WordPress setup
USER root

# The ENTRYPOINT from the base image will handle switching to www-data
# and starting Apache after the initial setup is complete