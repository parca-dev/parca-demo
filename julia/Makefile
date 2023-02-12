.PHONY: build
build:
	docker build -t parca-demo:julia .

build-patched:
	docker run --interactive --rm --volume="${PWD}:/build" --workdir=/build \
		docker.io/nixos/nix:2.11.1 sh -c '$$(nix-build --no-out-link)' | docker load
