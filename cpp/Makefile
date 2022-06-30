.PHONY: build
build: pie pie-with-fp no-pie no-pie-with-fp clang clang-with-fp

pie:
	docker build -t parca-demo:cpp-pie --build-arg GCC_FLAGS='-g' .

pie-with-fp:
	docker build -t parca-demo:cpp-pie-with-fp --build-arg GCC_FLAGS='-g -fno-omit-frame-pointer' --build-arg LD_LIBRARY_PATH='/usr/lib/libc6-prof/x86_64-linux-gnu' .


no-pie:
	docker build -t parca-demo:cpp --build-arg GCC_FLAGS='-g -no-pie' .

no-pie-with-fp:
	docker build -t parca-demo:cpp-with-fp --build-arg GCC_FLAGS='-g -no-pie -fno-omit-frame-pointer' --build-arg LD_LIBRARY_PATH='/usr/lib/libc6-prof/x86_64-linux-gnu' .

clang:
	docker build -f Dockerfile.clang -t parca-demo:cpp-clang --build-arg CLANG_FLAGS='-g' .

clang-with-fp:
	docker build -f Dockerfile.clang -t parca-demo:cpp-clang-with-fp --build-arg CLANG_FLAGS='-g -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer' --build-arg LD_LIBRARY_PATH='/usr/lib/libc6-prof/x86_64-linux-gnu' .
