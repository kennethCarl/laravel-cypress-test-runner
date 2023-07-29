FROM ubuntu:22.04
LABEL maintainer="Kenneth Carl Nacua Ybanez <kennethcarlybanez@gmail.com>"
ARG DEBIAN_FRONTEND=noninteractive

# docker
RUN apt-get update
RUN apt-get install ca-certificates curl gnupg -y -q
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y -q

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
    php8.2-cli \
    php8.2-gd \
    php8.2-ldap \
    php8.2-mbstring \
    php8.2-mysql \
    php8.2-mysqli \
    php8.2-pgsql \
    php8.2-sqlite3 \
    php8.2-xml \
    php8.2-xsl \
    php8.2-zip \
    php8.2-curl \
    php8.2-soap \
    php8.2-gmp \
    php8.2-bcmath \
    php8.2-intl \
    php8.2-imap \
    php8.2-phpdbg \
    php8.2-bz2 \
    php8.2-redis \
    libapache2-mod-php8.2 \
    php8.2-xdebug \
    php8.2-zip \
    php8.2-ldap \
    
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

RUN  echo "short_open_tag = on" >> /etc/php/8.2/apache2/php.ini
RUN  echo "[opcache]" >> /etc/php/8.2/apache2/php.ini
RUN  echo "opcache.enable=1" >> /etc/php/8.2/apache2/php.ini

RUN  echo "short_open_tag = on" >> /etc/php/8.2/cli/php.ini
RUN  echo "[opcache]" >> /etc/php/8.2/cli/php.ini
RUN  echo "opcache.enable=1" >> /etc/php/8.2/cli/php.ini