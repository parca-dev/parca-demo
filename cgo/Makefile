.PHONY: build
build: pie no-pie

pie:
	docker build -t parca-demo:cgo-pie --build-arg GO_BUILD_FLAGS='-buildmode=pie' .

no-pie:
	docker build -t parca-demo:cgo .
