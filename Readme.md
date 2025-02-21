# Cron job for docker swarm service
This is a simple cron job for docker swarm service. you can adapt it to your needs.

Goal is to get cron job logs in you docker service logs, so you can follow them with through docker logs.

## How implement
1. Put your desired command in `cron-script.sh` file. then set cron job time in `cron.jobs` file.

```
* * * * * /cron-script.sh >/proc/1/fd/1 2>/proc/1/fd/2
```

**Note:*/ `>/proc/1/fd/1 2>/proc/1/fd/2` is important to get logs in docker service logs. don't forget to add it to your cron job.

On service yaml file set `command` to `cron -f`, check the `cron-service.yaml` file for example.


And finally last but not least, `cron` add to your docker image. this is depend on your base image. for ubunut/debian based images you can use `apt-get install cron` to install cron. check `Dockerfile` for example.


**Note:** I used `php:8.3.14` as base image, you can change it to your desired base image.