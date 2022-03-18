#include <iostream>

unsigned int fibonacci(unsigned int n)
{
    if (n == 0)
        return 0;

    unsigned int a = 1, b = 1;
    for (unsigned int i = 3; i <= n; ++i)
    {
        unsigned int fib = a + b;
        a = b;
        b = fib;
    }

    return b;
}

int main()
{
    int limit = 1000000;
    for (int i = 0; i < limit; i++)
    {
        std::cout << "F(" << i << ") = " << fibonacci(i) << std::endl;
    }
    return 0;
}
