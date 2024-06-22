.PHONY: start
start: $(TARGET)
	docker build --build-arg TARGET=$(TARGET) --no-cache -t $(TARGET) .
	docker run -d --name $(TARGET) $(foreach port, $(PORTS), -p $(port):$(port)) $(TARGET)

$(TARGET):
	@if [ -z "$@" ]; then \
		echo "You need to specify TARGET ex: make start TARGET=simple_site"; \
	fi

.PHONY: clean
clean:
	@if [ -z "$(TARGET)" ]; then \
		echo "You need to specify TARGET ex: make clean TARGET=simple_site"; \
	else \
		docker stop $(TARGET); \
		docker container rm $(TARGET); \
		docker image rm $(TARGET); \
	fi

.PHONY: enter
enter:
	@if [ -z "$(TARGET)" ]; then \
		echo "You need to specify TARGET ex: make enter TARGET=simple_site"; \
	else \
		docker exec -it $(TARGET) sh; \
	fi

.PHONY: re
re:
	@if [ -z "$(TARGET)" ]; then \
		echo "You need to specify TARGET ex: make re TARGET=simple_site"; \
	else \
		make clean TARGET=$(TARGET); \
		make start TARGET=$(TARGET) PORTS=$(PORTS); \
	fi