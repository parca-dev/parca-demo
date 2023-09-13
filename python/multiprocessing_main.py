import signal
import sys

from multiprocessing import Pool
from threading import Semaphore

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


def gracefully_exit(pool):
    print('\nWrapping up, please wait...')
    pool.terminate()
    pool.join()
    print('Done!')
    sys.exit(0)


MAX_QUEUE_SIZE = 16
semaphore = Semaphore(MAX_QUEUE_SIZE)


def submit(pool, func, *args, **kwargs):
    global semaphore
    semaphore.acquire()
    pool.apply_async(func, args, kwargs,
                     callback=lambda result: semaphore.release())


MAX_WORKERS = 4


def main():
    with Pool(processes=MAX_WORKERS) as pool:
        # Register signal handlers for SIGINT and SIGTERM.
        signal.signal(
            signal.SIGINT,
            lambda signum, frame: gracefully_exit(pool))
        signal.signal(
            signal.SIGTERM,
            lambda signum, frame: gracefully_exit(pool))

        # Run the program.
        while True:
            submit(pool, baz, 42)


if __name__ == "__main__":
    sys.exit(main())
