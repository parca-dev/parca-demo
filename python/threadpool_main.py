import signal
import sys

from concurrent.futures import ThreadPoolExecutor
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


def exit_threads(executor):
    print('\nWrapping up, please wait...')
    py_version = sys.version_info
    if (py_version.major == 3) and (py_version.minor < 9):
        executor.shutdown(wait=True)
        while True:
            try:
                work_item = executor._work_queue.get_nowait()
            except queue.Empty:
                break
            if work_item is not None:
                work_item.future.cancel()
    else:
        executor.shutdown(wait=True, cancel_futures=True)
    print('Done!')
    sys.exit(0)


MAX_QUEUE_SIZE = 10
semaphore = Semaphore(MAX_QUEUE_SIZE)


def submit(executor, func, *args, **kwargs):
    global semaphore
    semaphore.acquire()
    future = executor.submit(func, *args, **kwargs)
    future.add_done_callback(lambda future: semaphore.release())


MAX_WORKERS = 4


def main():
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        # Register signal handlers for SIGINT and SIGTERM.
        signal.signal(
            signal.SIGINT,
            lambda signum, frame: exit_threads(executor))
        signal.signal(
            signal.SIGTERM,
            lambda signum, frame: exit_threads(executor))

        # Run the program.
        while True:
            submit(executor, baz, 42)


if __name__ == "__main__":
    sys.exit(main())
