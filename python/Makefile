.PHONY: build
build:
	docker build -t parca-demo:python .

build-custom:
	docker run --interactive --rm --volume="${PWD}:/build" --workdir=/build \
		docker.io/nixos/nix:2.13.2 sh -c '$$(nix-build --no-out-link)' | docker load
