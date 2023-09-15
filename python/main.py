import signal
import sys

from fibonacci import Fibonacci


def foo(n):
    fib = Fibonacci()
    for i in range(1, n):
        result = fib.calculate(i)
        Fibonacci.display_result(i, result)
        Fibonacci.reset()


def bar(n):
    foo(n)


def baz(n):
    bar(n)


def main():
    signal.signal(signal.SIGINT, lambda signum, frame: sys.exit(0))
    while True:
        baz(42)


if __name__ == "__main__":
    sys.exit(main())
