package main

import (
	"log"
)

/*
void fibonnaci(int n, int *result)
{
    if (n == 0) return;

    int a = 1, b = 1;
    for (int i = 3; i <= n; ++i)
    {
        int fib = a + b;
        a = b;
        b = fib;
    }

    *result = b;
}
*/
import "C"

func main() {
	go busyCPU()

	select {} // blocks forever
}

// Calculates Fibonacci numbers starting with 1 000 000th.
// Produces some CPU activity.
func busyCPU() {
	i := uint(1_000_000)
	for {
		var n C.int
		C.fibonnaci(C.int(i), &n)
		log.Println("fibonacci number", i, n)
		i++
	}
}
