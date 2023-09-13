export const fib = (n: number) => {
  switch (n) {
    case 1:
    case 2:
      return 1;
    default:
      return fib(n - 1) + fib(n - 1);
  }
};
