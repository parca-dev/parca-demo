#include <stdio.h>

#include "DemoJNI.h"

int __attribute__((noinline)) nativeTop1() {
  for (int i = 0; i < 1000; i++) {
  }

  return 0;
}

int __attribute__((noinline)) nativeTop2() {

  for (int i = 0; i < 1000; i++) {
  }

  return 0;
}

// ones
int __attribute__((noinline)) nativeC1() { return nativeTop1(); }

int __attribute__((noinline)) nativeB1() { return nativeC1(); }

JNIEXPORT void JNICALL Java_DemoJNI_nativeA1(JNIEnv *, jobject) {

  printf("%d", nativeB1());
}

// twos
int __attribute__((noinline)) nativeC2() { return nativeTop2(); }

int __attribute__((noinline)) nativeB2() { return nativeC2(); }

JNIEXPORT void JNICALL Java_DemoJNI_nativeA2(JNIEnv *, jobject) {
  printf("%d", nativeB2());
}
