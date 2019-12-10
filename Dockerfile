FROM quay.io/continuouspipe/magento2-nginx-php7.2-ng:latest
ARG IMAGE_VERSION=3

COPY . /app
RUN container build
