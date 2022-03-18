vendor: jb
	jb install

.PHONY: fmt
fmt: jsonnetfmt
	find . -name 'vendor' -prune -o -name '*.libsonnet' -print -o -name '*.jsonnet' -print | \
		xargs -n 1 -- jsonnetfmt -i

.PHONY: manifests
manifests: vendor jsonnet
	./build.sh

deploy: vendor manifests
	./monitoring-deploy.sh

jb:
	go install -v github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest

jsonnet:
	go install -v github.com/google/go-jsonnet/cmd/jsonnet@latest

jsonnetfmt:
	go install -v github.com/google/go-jsonnet/cmd/jsonnetfmt@latest
