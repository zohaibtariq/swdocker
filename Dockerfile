FROM php:8.1-apache
RUN rm /etc/apt/preferences.d/no-debian-php && apt-get update && apt-get install -y \
    apt-utils \
    libjpeg-dev \
    libmcrypt-dev \
    libpng-dev \
    libzip-dev \
    zip \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    git \
    curl \
    nano \
    gnupg2 \
    libxml2-dev \
    php-soap \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    unzip \
    php-redis
RUN curl -s https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install curl \
    dom \
    fileinfo \
    filter \
    pdo \
    session \
    xml \
    zip \
    pdo_mysql \
    -j$(nproc) gd \
    -j$(nproc) iconv \
    soap
RUN pecl install redis \
    mongodb \
    xdebug \
    zip
RUN docker-php-ext-enable \
    xdebug \
    zip \
    mongodb \
    redis
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite
RUN mkdir /var/www/html/api
RUN mkdir /var/www/html/api/public
RUN usermod -u 1000 www-data
ADD ./apache2/sites-available/api.conf /etc/apache2/sites-available/api.conf
RUN a2dissite 000-default
RUN a2ensite api
RUN service apache2 restart