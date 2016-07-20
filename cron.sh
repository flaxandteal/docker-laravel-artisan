#!/bin/sh

env > /root/env.txt

touch /var/log/cron.log
cron
exec tail -f /var/log/cron.log
