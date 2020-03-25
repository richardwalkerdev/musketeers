# ACCOUNT_PATH is set as an Environment Variable under Buildkite Pipeline Settings
# ACCOUNT_PATH='/opt/app'

COMPOSE_SERVICE='my-alpine'

# DOCKER_COMPOSE := docker-compose run --rm $(COMPOSE_SERVICE) --user="$(CURRENT_UID)"

# AWS_BASH := $(DOCKER_COMPOSE) --entrypoint="/bin/bash"

echo:
	docker-compose run --rm $(COMPOSE_SERVICE) echo 'OpenShift Pipeline'

compare: 
	docker-compose run --rm $(COMPOSE_SERVICE) echo "Comparing versions"
	docker-compose run --rm $(COMPOSE_SERVICE) echo "ACCOUNT_PATH = $(ACCOUNT_PATH)"
	docker-compose run --rm $(COMPOSE_SERVICE) ./scripts/compare-versions.sh 