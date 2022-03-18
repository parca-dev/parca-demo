vendor:
	jb install

.PHONY: fmt
fmt:
	find . -name 'vendor' -prune -o -name '*.libsonnet' -print -o -name '*.jsonnet' -print | \
		xargs -n 1 -- $(JSONNET_FMT) -i

.PHONY: manifests
manifests:
	./build.sh

deploy: vendor manifests
	./monitoring-deploy.sh
