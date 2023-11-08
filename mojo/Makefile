# Read the modular.cfg file and get the user.id value.
MODULAR_AUTH_KEY ?= $(shell stoml ~/.modular/modular.cfg user.id)

.PHONY: build
build:
	echo "Building the image..."
	docker build -t parca-demo:mojo .

.PHONY: stoml
stoml:
	# stoml is a tool for reading and writing TOML files.
	go install github.com/freshautomations/stoml@latest

.PHONY: base
base:
	echo "Building the base image..."
	./build_mojo_image.sh --auth-key ${MODULAR_AUTH_KEY}
