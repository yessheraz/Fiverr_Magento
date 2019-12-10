FROM sensson/magento2
COPY * /var/www/html/

# Start
EXPOSE 80 443
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
