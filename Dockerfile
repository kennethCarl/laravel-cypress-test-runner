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

RUN apt-get install -y autoconf automake libtool
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
    php8.3-cli \
    php8.3-gd \
    php8.3-ldap \
    php8.3-mbstring \
    php8.3-mysql \
    php8.3-mysqli \
    php8.3-pgsql \
    php8.3-sqlite3 \
    php8.3-xml \
    php8.3-xsl \
    php8.3-zip \
    php8.3-curl \
    php8.3-soap \
    php8.3-gmp \
    php8.3-bcmath \
    php8.3-intl \
    php8.3-imap \
    php8.3-phpdbg \
    php8.3-bz2 \
    php8.3-redis \
    libapache2-mod-php8.3 \
    php8.3-xdebug \
    php8.3-zip \
    php8.3-ldap \
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

# node20
RUN curl -sL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh
RUN apt-get install -y nodejs

# git
RUN apt-get install -y git

RUN  echo "short_open_tag = on" >> /etc/php/8.3/apache2/php.ini
RUN  echo "[opcache]" >> /etc/php/8.3/apache2/php.ini
RUN  echo "opcache.enable=1" >> /etc/php/8.3/apache2/php.ini

RUN  echo "short_open_tag = on" >> /etc/php/8.3/cli/php.ini
RUN  echo "[opcache]" >> /etc/php/8.3/cli/php.ini
RUN  echo "opcache.enable=1" >> /etc/php/8.3/cli/php.ini