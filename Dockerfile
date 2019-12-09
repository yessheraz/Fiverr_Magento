FROM php:7.1-apache
RUN requirements="cron libpng-dev libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6 libjpeg62-turbo libjpeg62-turbo-dev libfreetype6-dev libicu-dev libxslt1-dev" \
 && apt-get update \
 && apt-get install -y $requirements \
 && rm -rf /var/lib/apt/lists/* \
 && docker-php-ext-install pdo_mysql \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install gd \
 && docker-php-ext-install mcrypt \
 && docker-php-ext-install mbstring \
 && docker-php-ext-install zip \
 && docker-php-ext-install intl \
 && docker-php-ext-install xsl \
 && docker-php-ext-install soap \
 && docker-php-ext-install bcmath
 
 RUN a2enmod rewrite



RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN chown -R www-data:www-data /var/www

USER www-data

COPY --chown=www-data . /var/www/html

RUN chmod u+x bin/magento

## switch back
USER root

## run cron alongside apache
CMD [ "sh", "-c","apache2-foreground" ]





#FROM pamidu/magento_labba:latest

#WORKDIR /var/www/html/Magento_labba
#COPY * /var/www/html/Magento_labba/
#CMD chmod -R 777 /var/www/html
#CMD chown -R www-data:www-data /var/www/html
#FROM xantek/magento2devbox-web
#COPY . /var/www/magento2/
#CMD chmod -R 777 /var/www

