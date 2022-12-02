.PHONY: build
build:
	docker build -t parca-demo:java-jni .

.PHONY: generate
generate:
	javac -h . DemoJNI.java

.PHONY: compile
compile: generate lib/libdemo.so

lib/libdemo.so:
	mkdir -p lib
	g++ -g -fno-omit-frame-pointer -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux DemoJNI.cpp -shared -o lib/libdemo.so

.PHONY: run
run: compile
	java -cp . -Djava.library.path=./lib DemoJNI

.PHONY: clean
clean:
	rm -rf lib/*.so DemoJNI.h *.o *.so *.class
