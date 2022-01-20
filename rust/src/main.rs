use std::{thread, time};

fn main() {
    let cpu = std::thread::spawn(move || {
        let delay = time::Duration::from_secs(1);
        loop {
            let result = fibonacci(42);
            println!("The result is {}", result);
            thread::sleep(delay);
        }
    });

    let mem = std::thread::spawn(move || {
        let delay = time::Duration::from_secs(5);
        loop {
            println!("It would be great to allocate some memory");
            thread::sleep(delay);
        }
    });

    cpu.join().unwrap();
    mem.join().unwrap();
}

fn fibonacci(n: u64) -> u64 {
    match n {
        0 => panic!("zero not allowed"),
        1 | 2 => 1,
        _ => fibonacci(n - 1) + fibonacci(n - 2),
    }
}
