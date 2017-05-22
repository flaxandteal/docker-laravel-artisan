FROM flaxandteal/docker-laravel-phpfpm:fpm-7

RUN apt-get update -y && apt-get install -y cron curl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY crontab /etc/cron.d/laravel
RUN chmod 644 /etc/cron.d/laravel
COPY cron.sh /

VOLUME ["/var/www/app"]

WORKDIR /var/www/app

ENTRYPOINT ["php", "artisan"]
CMD ["--help"]
