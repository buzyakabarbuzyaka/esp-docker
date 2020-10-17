SCRIPT_FOLDER = `pwd`

.PHONY: build_builder
build_builder:
	docker-compose build builder

.PHONY: run_builder
run_builder:
	make build_builder && \
	docker-compose run --rm builder

.PHONY: build_loader
build_loader:
	docker-compose build loader

.PHONY: run_loader
run_loader:
	make build_loader && \
	docker-compose run --rm loader

.PHONY: build_all
build_all:
	docker-compose build

.PHONY: run_all
run_all:
	docker-compose run --rm builder && \
	docker-compose run --rm loader