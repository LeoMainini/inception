srcs_f =	srcs

user_dir = ${HOME}

data_dir = $(user_dir)/data

wp_dir = $(data_dir)/wordpress

db_dir = $(data_dir)/mariadb

all: build run

$(db_dir):
		@if [ -d $(db_dir) ]; then echo "Found data folder" ; else mkdir $(db_dir); fi

$(data_dir):
		@if [ -d $(data_dir) ]; then echo "Found database folder" ; else mkdir $(data_dir); fi

$(wp_dir):
		@if [ -d $(wp_dir) ]; then echo "Found wordpress folder" ; else mkdir $(wp_dir); fi

make_dirs:	$(data_dir)  $(wp_dir) $(db_dir)

build:	make_dirs
		docker compose --project-directory $(srcs_f) build --no-cache 2> log-err.txt

run:
		docker compose --project-directory $(srcs_f) up -d

stop:
		docker compose --project-directory $(srcs_f) stop

down: 
		docker compose --project-directory $(srcs_f) down

restart:	stop run

rebuild:	down build


delete-dockerconts: down deinit
		docker images -q | xargs -n1 -r docker rmi 

reset:	delete-dockerconts
		sudo rm -rf /var/lib/docker
		sudo systemctl restart docker

deinit:
		sudo rm -f ~/data/mariadb/db/.initialized

re:		down deinit build run

.PHONY: all down $(db_dir) $(data_dir) $(wp_dir) make_dirs build run down stop rebuild restart re reset deinit delete-dockerconts

