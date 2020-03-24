# ACCOUNT_PATH is set as an Environment Variable under Buildkite Pipeline Settings
# ACCOUNT_PATH='/opt/app'

CURRENT_UID := $(shell id -u)

DOCKER_COMPOSE := docker-compose run --rm alpine --user="$(CURRENT_UID)"

AWS_BASH := $(DOCKER_COMPOSE) --entrypoint="/bin/bash"

echo:
	docker-compose run --rm alpine echo 'OpenShift Pipeline'

compare: 
	docker-compose run --rm alpine echo "Comparing versions."
	docker-compose run --rm alpine echo $(ACCOUNT_PATH)
	docker-compose run --rm alpine ./scripts/compare-versions.sh