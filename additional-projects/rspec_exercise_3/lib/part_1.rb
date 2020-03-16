def is_prime?(num)
    return false if num < 2

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end

    true
end

def nth_prime(n)
    primes = []
    (2..Float::INFINITY).each do |i|
        primes << i if is_prime?(i)
        if primes.length == n
            return primes[-1]
        end
    end
end

def prime_range(min, max)
    primes = []
    (min..max).each { |i| primes << i if is_prime?(i) == true }
    return primes
end