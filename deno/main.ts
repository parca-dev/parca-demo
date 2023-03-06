function fib(n: number): number {
  if (n <= 2) {
    return 1;
  }

  return fib(n - 1) + fib(n - 2);
}

setInterval(() => {
    const n = 42
    console.log(`fib(${n}) = ${fib(n)}`)
}, 1000)

export {};
