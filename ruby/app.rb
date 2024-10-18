require 'prime'
require 'fileutils'

STDOUT.sync = true

def a(n)
    b(n)
end

def b(n)
    ## Make some calculations
    i = 100_000
    while i > 0 do
        Prime.prime?(i)
        i -= 1
    end
    c(n)
end

def c(n)
    ## Create a new file
    File.open("test.txt", "w") do |f|
        f.write("Hello, world!")
    end
    ## Pass new file to d
    d("test.txt")
end

def d(file)
    ## Read file
    File.open(file, "r") do |f|
        ## Print file contents and time
        puts f.read + " :: " + Time.now.to_s
    end
    f(file)
end

def f(file)
    ## Delete file
    File.delete(file)
end

## Infinte loop
while true
    sleep(1)
    a(1)
end

