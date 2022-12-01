const fib = (n) => {
    switch (n) {
        case 1:
        case 2:
            return 1;
        default:
            return fib(n-1) + fib(n-1)
    }
}

setInterval(() => {
    const n = 35
    console.log(`fib(${n}) is ${fib(n)}`)
}, 1000)
