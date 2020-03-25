# ACCOUNT_PATH is set as an Environment Variable under Buildkite Pipeline Settings
# ACCOUNT_PATH='/opt/app'

CONTAINER_IMAGE='alpine-test'
#CONTAINER_IMAGE='musketeers'

DOCKER_COMPOSE := docker-compose run --rm $(CONTAINER_IMAGE) --user="$(CURRENT_UID)"

AWS_BASH := $(DOCKER_COMPOSE) --entrypoint="/bin/bash"

echo:
	docker-compose run --rm $(CONTAINER_IMAGE) echo 'OpenShift Pipeline'

compare: 
	docker-compose run --rm $(CONTAINER_IMAGE) echo "Comparing versions."
	docker-compose run --rm $(CONTAINER_IMAGE) echo $(ACCOUNT_PATH)
	docker-compose run --rm $(CONTAINER_IMAGE) ./scripts/compare-versions.sh 