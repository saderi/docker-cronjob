# Cron Job for Docker Swarm Service
This is a simple cron job for docker swarm service. You can adapt it to your needs.

The goal is to get cron job logs into your Docker service logs so you can follow them through Docker logs.

## How to Implement
1. Put your desired command in the `cron-script.sh` file, then set the cron job time in the `cron.jobs` file.

```
* * * * * /cron-script.sh >/proc/1/fd/1 2>/proc/1/fd/2
```

**Note:** `>/proc/1/fd/1 2>/proc/1/fd/2` is important to get logs in docker service logs. don't forget to add it to your cron job.

In the service YAML file, set `command` to `cron -f`. Check the `cron-service.yaml` file for an example.


Finally, add `cron` to your Docker image. This depends on your base image. For Ubuntu/Debian-based images, you can use `apt-get install cron` to install cron. Check the `Dockerfile` for an example.


**Note:** I used `php:8.3.14` as the base image, but you can change it to your desired base image.