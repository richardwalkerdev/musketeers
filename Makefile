# ACCOUNT_PATH is set as an Environment Variable under Buildkite Pipeline Settings
# ACCOUNT_PATH='/opt/app'

DOCKER_COMPOSE := docker-compose run --rm flemay/musketeers --user="$(CURRENT_UID)"

AWS_BASH := $(DOCKER_COMPOSE) --entrypoint="/bin/bash"

echo:
	docker-compose run --rm musketeers echo 'OpenShift Pipeline'

compare: 
	docker-compose run --rm musketeers echo "Comparing versions."
	docker-compose run --rm musketeers echo $(ACCOUNT_PATH)
	docker-compose run --rm musketeers --entrypoint="/bin/sh" ./scripts/compare-versions.sh 