function fibonacci(n)
    if n == 1 || n == 2
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end


while true
    @show fibonacci(42)
    sleep(1)
end
