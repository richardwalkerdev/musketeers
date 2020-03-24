echo:
	docker-compose run --rm alpine echo 'OpenShift Pipeline'

.PHONY: compare
compare: 
	echo "Comparing versions."
	./scripts/compare-versions.sh