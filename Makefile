CURRENT_UID := $(shell id -u)

DOCKER_COMPOSE := docker-compose run --rm alpine --user="$(CURRENT_UID)"

AWS_BASH := $(DOCKER_COMPOSE) --entrypoint="/bin/bash"

#ACCOUNT_PATH='test'

echo:
	docker-compose run --rm alpine echo 'OpenShift Pipeline'

compare: 
	docker-compose run --rm alpine echo "Comparing versions."
	docker-compose run --rm alpine echo $(ACCOUNT_PATH)
	#./scripts/compare-versions.sh