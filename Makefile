build:
	docker build -t corn-test:local .

up:
	docker stack deploy -c cron-service.yml cron

down:
	docker stack rm cron

logs:
	docker service logs -f --tail 10 cron_test