import { fib } from "@ps-ts-with-bundler/fibonacci/src/";
import { sum } from "@ps-ts-with-bundler/sum/src/";

for (;;) {
  console.log(`Fib of ${30} is ${fib(30)}`);
  console.log(`Load of ${3200000000} is ${sum(3200000000)}`);
}
