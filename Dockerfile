FROM xantek/magento2devbox-web
COPY . /var/www/magento2/
CMD chmod -R 777 /var/www

