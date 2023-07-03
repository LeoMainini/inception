srcs_f =	srcs

docker_src = $(srcs_f)/docker_compose.yml

nginx_srcs =	$(nginx_f)/nginx/Dockerfile

all: $(docker_src)

$(docker_src):
		docker compose --project-directory $(srcs_f) build --no-cache
		docker compose --project-directory $(srcs_f) up -d

down: 
		docker compose --project-directory $(srcs_f) down

.PHONY: all down exec $(docker_src)

