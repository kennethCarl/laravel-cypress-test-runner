FROM ubuntu:22.04
LABEL maintainer="Kenneth Carl Nacua Ybanez <kennethcarlybanez@gmail.com>"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y tzdata apt-utils
RUN apt-get install -y supervisor
RUN apt-get install -y software-properties-common libterm-readline-gnu-perl curl
RUN add-apt-repository ppa:ondrej/php
RUN add-apt-repository ppa:ondrej/apache2

RUN apt-get update -y
RUN apt-get install -y -q \
    unzip \
    mariadb-client \
    apache2 \
    net-tools \
    dos2unix \
    php8.1-cli \
    php8.1-gd \
    php8.1-ldap \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-mysqli \
    php8.1-pgsql \
    php8.1-sqlite3 \
    php8.1-xml \
    php8.1-xsl \
    php8.1-zip \
    php8.1-curl \
    php8.1-soap \
    php8.1-gmp \
    php8.1-bcmath \
    php8.1-intl \
    php8.1-imap \
    php8.1-phpdbg \
    php8.1-bz2 \
    php8.1-redis \
    libapache2-mod-php8.1 \
    php8.1-xdebug \
    php8.1-zip \
    php8.1-ldap \
    
    # cypress depedencies
    libgtk2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb

# composer
# composer
ENV COMPOSER_HOME=/composer
ENV PATH=./vendor/bin:/composer/vendor/bin:/root/.yarn/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# node18
RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh
RUN apt-get install -y nodejs

# git
RUN apt-get install -y git