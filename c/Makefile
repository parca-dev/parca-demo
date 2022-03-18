.PHONY: build
build: pie no-pie

pie:
	docker build -t parca-demo:c-pie --build-arg GCC_FLAGS='-g' .

no-pie:
	docker build -t parca-demo:c --build-arg GCC_FLAGS='-g -no-pie' .
