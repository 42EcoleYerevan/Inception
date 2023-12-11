name = inception
docker_compose_path = ./srcs/docker-compose.yaml
all:
	@docker-compose -f ${docker_compose_path} up -d

build:
	@docker-compose -f ${docker_compose_path} up -d --build

down:
	@docker-compose -f ${docker_compose_path} down

re:
	@docker-compose -f ${docker_compose_path} up -d --build

clean: down
	@docker system prune -a

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all build down re clean fclean
