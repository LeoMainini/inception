dctest_f = dctest

dctest_env = $(dctest_f)/.env

dctest_srcs =	$(dctest_f)/Dockerfile $(dctest_f)/docker-compose.yml \
				$(dctest_f)/app.py $(dctest_f)/requirements.txt $(dctest_f)/.env

all: dctest

dctest: $(dctest_srcs)
		docker compose --project-directory $(dctest_f) up

down: 
		docker compose --project-directory $(dctest_f) down

.PHONY: all dctest

