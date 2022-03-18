#include <stdio.h>

long long int fibonnaci(int n)
{
    if (n == 0)
        return 0;

    int a = 1, b = 1;
    for (int i = 3; i <= n; ++i)
    {
        int fib = a + b;
        a = b;
        b = fib;
    }

    return b;
}

int main()
{
    int limit = 1000000;
    for (int i = 1; i < limit; i++)
    {
        printf("fibonnaci number: %lld\n", fibonnaci(i));
    }
    return 0;
}
