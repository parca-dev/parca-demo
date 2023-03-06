fn main() {
    let n = 42;
    loop {
        println!("fib({}) = {}", n, fib(n));
    }
}

fn fib(n: u32) -> u32 {
    if n <= 2 {
        1
    } else {
        fib(n - 1) + fib(n - 2)
    }
}
