
all:
	@mkdir -p /home/ybassour/data/mariadb
	@mkdir -p /home/ybassour/data/wordpress
	@mkdir -p /home/ybassour/data/redis
	@mkdir -p /home/ybassour/data/advisor

	@docker compose -f ./srcs/docker-compose.yml up -d --build

up: all

down:
	
	@docker compose -f ./srcs/docker-compose.yml down


clean:
	@docker compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo rm -rf /home/ybassour/data/mariadb
	@sudo rm -rf /home/ybassour/data/wordpress
	@sudo rm -rf /home/ybassour/data/redis
	@sudo rm -rf /home/ybassour/data/advisor


re: fclean all

.PHONY: all down clean fclean re
