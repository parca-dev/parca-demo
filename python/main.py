def fibonacci(n):
    if n == 1 or n == 2:
        return 1
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)

def foo(n):
    for i in range(1, n):
        print(fibonacci(i))

def bar(n):
    foo(n)

def baz(n):
    bar(n)

if __name__ == "__main__":
    while True:
        baz(42)
