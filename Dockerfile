FROM php:8.3.14

# install cron 
RUN apt-get update && apt-get install --no-install-recommends -y \
    cron


COPY cron-script.sh /cron-script.sh
COPY cron.jobs /etc/cron.d/cron.jobs
RUN chmod +x /cron-script.sh
RUN crontab /etc/cron.d/cron.jobs
