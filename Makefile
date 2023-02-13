include srcs/.env
DOCKER_COMPOSE_FILE_PATH = srcs/docker-compose.yml
NAME = inception

all:		$(NAME)

$(NAME):
	VOLUME_PATH=$(shell cat srcs/.env | grep ^VOLUME_PATH= | awk '{split($$1, arr, "="); printf "%s", arr[2];}')
	mkdir -p ${VOLUME_PATH}/data/db ${VOLUME_PATH}/data/wp
	docker-compose -f $(DOCKER_COMPOSE_FILE_PATH) up --build # TODO -d

clean:
	docker-compose -f $(DOCKER_COMPOSE_FILE_PATH) down

fclean:		clean
	- docker volume rm $(docker volume ls -q)
	- docker network rm $(docker network ls -q)
	- rm -rf data

re:
	make fclean
	make all

ps:
	docker-compose -f $(DOCKER_COMPOSE_FILE_PATH) ps -a

.PHONY:		all clean fclean re ps
