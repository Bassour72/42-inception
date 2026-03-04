
all:
	@mkdir -p /home/${USER}/data/mariadb
	@mkdir -p /home/${USER}/data/wordpress
	@mkdir -p /home/${USER}/data/redis
	@docker compose -f ./srcs/docker-compose.yml up -d --build

up: all

down:
	
	@docker compose -f ./srcs/docker-compose.yml down


clean:
	@docker compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo rm -rf /home/${USER}/data/mariadb
	@sudo rm -rf /home/${USER}/data/wordpress
	@sudo rm -rf /home/${USER}/data/redis

re: fclean all

.PHONY: all down clean fclean re
