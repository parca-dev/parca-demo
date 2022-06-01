#include <fcntl.h>
#include <iostream>
#include <unistd.h>


int __attribute__((noinline)) top() {
  for (int i = 0; i < 100000; i++) {
    int fd = open("/", O_DIRECTORY);
    close(fd);
  }

  return 0;
}

// ones
int __attribute__((noinline)) c1() { return top(); }

int __attribute__((noinline)) b1() { return c1(); }

int __attribute__((noinline)) a1() { return b1(); }

// twos
int __attribute__((noinline)) c2() { return top(); }

int __attribute__((noinline)) b2() { return c2(); }

int __attribute__((noinline)) a2() { return b2(); }

int main() {
  while (true) {
    std::cout << "Calling a1" << std::endl;
    a1();
    std::cout << "Calling a2" << std::endl;
    a2();
  }
  return 0;
}
