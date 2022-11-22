import time


def fibonacci(n):
    if n == 1 or n == 2:
        return 1
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)


while True:
    print(fibonacci(42))
    time.sleep(1)
