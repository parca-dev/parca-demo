.PHONY: build
build: pie no-pie with-clang

pie:
	docker build -t parca-demo:cpp-pie --build-arg GCC_FLAGS='-g' .

no-pie:
	docker build -t parca-demo:cpp --build-arg GCC_FLAGS='-g -no-pie' .

with-clang:
	docker build -f Dockerfile.clang -t parca-demo:cpp-clang --build-arg CLANG_FLAGS='-g' .
