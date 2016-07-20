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

RUN apt-get install -y cron

COPY crontab /etc/cron.d/
COPY cron.sh /

RUN mkdir -p /data/www

VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["php", "artisan"]
CMD ["--help"]
