package main

import (
	"log"
	"math/big"
	"time"
)

func main() {
	go busyCPU()
	go allocMem()

	select {} // blocks forever
}

// Calculates Fibonacci numbers starting with 1 000 000th.
// Produces some CPU activity.
func busyCPU() {
	i := uint(1_000_000)
	for {
		log.Println("fibonacci number", i, fibonacci(i))
		i++
	}
}

// Allocate 20KB of memory every second, and don't free it.
// Don't do this at home.
func allocMem() {
	buf := []byte{}
	mb := 20 * 1024

	for {
		buf = append(buf, make([]byte, mb)...)
		log.Println("total allocated memory", len(buf))
		time.Sleep(time.Second)
	}
}

func fibonacci(n uint) *big.Int {
	if n <= 1 {
		return big.NewInt(int64(n))
	}

	var n2, n1 = big.NewInt(0), big.NewInt(1)

	for i := uint(1); i < n; i++ {
		n2.Add(n2, n1)
		n1, n2 = n2, n1
	}

	return n1
}
