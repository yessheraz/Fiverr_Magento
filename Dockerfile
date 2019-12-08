FROM pamidu/magento2:latest
COPY . /var/www/html
CMD ./start.sh

