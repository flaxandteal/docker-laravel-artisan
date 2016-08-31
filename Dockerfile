FROM dylanlindgren/docker-phpcli:latest

# UPSTREAM MAINTAINER "Dylan Lindgren" <dylan.lindgren@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y \
    php5-mcrypt \
    php5-mongo \
    php5-mssql \
    php5-mysqlnd \
    php5-pgsql \
    php5-redis \
    php5-sqlite \
    php5-curl \
    php5-gd

RUN apt-get update -y && apt-get install -y cron curl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY crontab /etc/cron.d/laravel
RUN chmod 644 /etc/cron.d/laravel
COPY cron.sh /

RUN mkdir -p /data/logs

VOLUME ["/var/www/app"]

WORKDIR /var/www/app

ENTRYPOINT ["php", "artisan"]
CMD ["--help"]
