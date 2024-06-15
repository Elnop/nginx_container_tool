.PHONY: run
run: $(TARGET)
	@if [ -z "$(TARGET)" ]; then \
		echo "You need to specify TARGET ex: make run TARGET=simple_site"; \
	else \
		docker run --name $(TARGET) -p 2000:2000 -d $(TARGET); \
	fi

.PHONY: $(TARGET)
$(TARGET):
	docker build --build-arg TARGET=$(TARGET) \
	--no-cache \
	-t $(TARGET) \
	.

.PHONY: clean
clean: $(TARGET)
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
		echo "You need to specify TARGET ex: make run TARGET=simple_site"; \
	else \
		docker exec -it $(TARGET) bash; \
	fi

.PHONY: help
help
	@cat README.md