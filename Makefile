CURRENT_UID := $(shell id -u)

DOCKER_COMPOSE := docker-compose run --user="$(CURRENT_UID)"

AWS_BASH := $(DOCKER_COMPOSE) --entrypoint="/bin/bash" aws

ACCOUNT_PATH='test'

echo:
	docker-compose run --rm alpine echo 'OpenShift Pipeline'

.PHONY: compare
compare: 
	echo "Comparing versions."
	$(AWS_BASH) ./scripts/compare-versions.sh