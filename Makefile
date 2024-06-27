NAME="nginx"
PORT="2000"
WWW="www/simple_site"
CONFIG="configs/simple_site.conf"

.PHONY: start
start:
	@if [ -z "$(WWW)" -o -z "$(CONFIG)" ]; then \
		echo "You need to specify CONFIG and WWW paths\nex: make start CONFIG=configs/simple_site.conf WWW=www/simple_site"; \
	else \
		docker build \
			--build-arg CONFIG=$(CONFIG) \
			--build-arg WWW=$(WWW) \
			--no-cache \
			-t $(NAME) \
			.; \
		docker run \
			-d \
			--name $(NAME) \
			$(foreach port, $(PORT), -p $(port):$(port)) \
			$(NAME); \
	fi

.PHONY: clean
clean:
	@if [ -z "$(NAME)" ]; then \
		echo "You need to specify NAME ex: make clean NAME=simple_site"; \
	else \
		docker stop $(NAME); \
		docker container rm $(NAME); \
		docker image rm $(NAME); \
	fi

.PHONY: enter
enter:
	@if [ -z "$(NAME)" ]; then \
		echo "You need to specify NAME ex: make enter NAME=simple_site"; \
	else \
		docker exec -it $(NAME) sh; \
	fi

.PHONY: re
re:
	@if [ -z "$(NAME)" ]; then \
		echo "You need to specify NAME ex: make re NAME=simple_site"; \
	else \
		make clean NAME=$(NAME); \
		make start NAME=$(NAME) PORT=$(PORT); \
	fi