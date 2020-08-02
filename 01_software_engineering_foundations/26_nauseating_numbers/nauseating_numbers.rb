#Phase 1: No big deal.

#strange_sums
#Write a method strange_sums that accepts an array of numbers as an argument.
#The method should return a count of the number of distinct pairs of elements that have a sum of zero.
#You may assume that the input array contains unique elements.
def strange_sums(arr)
  count = 0

  (0...arr.length).each do |idx_1|
    (idx_1+1...arr.length).each do |idx_2|
      count += 1 if (arr[idx_1] + arr[idx_2]) == 0
    end
  end
  count
end

#pair_product
#Write a method pair_product that accepts an array of numbers and a product as arguments.
#The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together.
#You may assume that the input array contains unique elements.
def pair_product(arr, product)
  (0...arr.length).each do |idx_1|
    (idx_1+1...arr.length).each do |idx_2|
        return true if (arr[idx_1] * arr[idx_2]) == product
    end
  end
  return false
end

#rampant_repeats
#Write a method rampant_repeats that accepts a string and a hash as arguments.
#The method should return a new string where characters of the original string are repeated the number of times specified by the hash.
#If a character does not exist as a key of the hash, then it should remain unchanged.
def rampant_repeats(str, hash)
  new_str = ''
  str.each_char do |char|
    if hash.has_key?(char)
      hash[char].times do
        new_str << char
      end
    else
      new_str << char
    end
  end
  new_str
end

#perfect_square?
#Write a method perfect_square? that accepts a number as an argument.
#The method should return a boolean indicating whether or not the argument is a perfect square.
#A perfect square is a number that is the product of some number multiplied by itself.
#For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.
def perfect_square?(num)
  (1...num).each do |i|
      return true if i * i == num
  end
  false
end

#Phase 2: Nothing you can't handle.

#anti_prime?
#Write a method anti_prime? that accepts a number as an argument.
#The method should return true if the given number has more divisors than all positive numbers less than the given number.
#For example, 24 is an anti-prime because it has more divisors than any positive number less than 24.
#Math Fact: Numbers that meet this criteria are also known as highly composite numbers.
def factors(num)
  factors = []
  (1..num).each do |i|
    factors << i if num % i == 0
  end
  
  factors
end

def anti_prime?(num)
  highest_composite = 1
  (1..num).each do |i|
    if factors(i).length > factors(highest_composite).length
      highest_composite = i
    end
  end

  return highest_composite == num
end

#matrix_addition
#Let a 2-dimensional array be known as a "matrix".
#Write a method matrix_addition that accepts two matrices as arguments.
#The two matrices are guaranteed to have the same "height" and "width".
#The method should return a new matrix representing the sum of the two arguments.
#To add matrices, we simply add the values at the same positions:
def matrix_addition(m1, m2)
  height = m1.length
  width = m1[0].length
  result = Array.new(height) { [0] * width }

  (0...height).each do |row|
    (0...width).each do |col|
      result[row][col] = m1[row][col] + m2[row][col]
    end
  end

  result
end

#mutual_factors
#Write a method mutual_factors that accepts any amount of numbers as arguments.
#The method should return an array containing all of the common divisors shared among the arguments.
#For example, the common divisors of 50 and 30 are 1, 2, 5, 10.
#You can assume that all of the arguments are positive integers.
def mutual_factors(*nums)
  factors = []

  (1..nums.max).each do |i|
    mutual = 0
    nums.each do |num|
      mutual += 1 if num % i == 0
    end
    factors << i if mutual == nums.length
  end
    
factors
end

#tribonacci_number
#The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are 1, 1, and 2.
#To generate the next number of the sequence, we take the sum of the previous three numbers.
#The first six numbers of tribonacci sequence are: 1, 1, 2, 4, 7, 13, ... and so on
#Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.
def tribonacci_number(n)
  return 1 if n == 1 || n == 2
  return 2 if n == 3

  return tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
end

#Phase 3: Now we're having fun.

#matrix_addition_reloaded
#Write a method matrix_addition_reloaded that accepts any number of matrices as arguments.
#The method should return a new matrix representing the sum of the arguments.
#Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", then return nil.
def matrix_addition_reloaded(*matrices)
  matrix = matrices.first
  height = matrix.length
  width = matrix[0].length

  empty_matrix = Array.new(height) { [0] * width }
  matrices.inject(empty_matrix) do |m1, m2|
    return nil if m2.length != height or m2[0].length != width
    matrix_addition(m1, m2)
  end
end

#squarocol?
#Write a method squarocol? that accepts a 2-dimensional array as an argument.
#The method should return a boolean indicating whether or not any row or column is completely filled with the same element.
#You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.
def squarocol?(grid)
  return true if grid.any? { |row| row.uniq.length == 1 }
  return true if grid.transpose.any? { |col| col.uniq.length == 1 }
  false
end


#pascals_triangle
#Write a method pascals_triangle that accepts a positive number, n, as an argument and returns a 2-dimensional array representing the first n levels of pascal's triangle.
def pascals_triangle(n)
  #return nil if n < 0
  triangle = [1]
  return triangle if n == 1
  return triangle << [1, 1] if n ==2

  x = 1
  while x <= n
    triangle << new_line(x)
    x += 1
  end
  return triangle
end

def new_line(n)
  i = 0
  j = i+1
  new = []
  iterate = n - 2

  iterate.times do
    previous_line = pascals_traingle(n-1)
    new << (previous_line[i] + previous_line[j])
    i +=1
  end

  new.shift[1]
  new.push[1]
  return new
end

#Phase 4: Nauseating.

#mersenne_prime
#A "Mersenne prime" is a prime number that is one less than a power of 2.
#This means that it is a prime number with the form 2^x - 1, where x is some exponent. For example:
#   3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
#   7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
#   11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1
def mersenne_prime(n)
  prime = []

  i = 2
  while i < 20
    total = 2**i
    prime << total-1 if prime?(total-1)
    i += 1
  end
  prime[n-1]
end

def prime?(n)
  (2...n).each do |i|
    return false if n % i == 0
  end
  true
end

#triangular_word?
#A triangular number is a number of the form (i * (i + 1)) / 2 where i is some positive integer.
#Substituting i with increasing integers gives the triangular number sequence.
#The first five numbers of the triangular number sequence are 1, 3, 6, 10, 15.
#Write a method triangular_word? that accepts a word as an argument and returns a boolean indicating whether or not that word's number encoding is a triangular number.
#You can assume that the argument contains lowercase letters.
def triangular_word?(str)
  alphabet = ('a'..'z').to_a

  word_sum = 0
  str.each_char do |char|
    index = alphabet.index(char) 
    word_sum += (index + 1)
  end
  triangular_number(word_sum)
end

def triangular_number(num)
  sum = 0
  n = 1
  while sum <= num
    sum = sum + n
    return true if sum == num
    n += 1
  end
  false
end

#consecutive_collapse
#Write a method consecutive_collapse that accepts an array of numbers as an argument.
#The method should return a new array that results from continuously removing consecutive numbers that are adjacent in the array.
#If multiple adjacent pairs are consecutive numbers, remove the leftmost pair first.
def collapse(nums)
  (0...nums.length - 1).each do |i|
    if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
      return nums[0...i] + nums[i + 2..-1]
    end
  end

  nums
end

def consecutive_collapse(numbers)
  numbers.each { numbers = collapse(numbers) }
  numbers
end

#pretentious_primes
#Write a method pretentious_primes that takes accepts an array and a number, n, as arguments.
#The method should return a new array where each element of the original array is replaced according to the following rules:
#   when the number argument is positive, replace an element with the n-th nearest prime number that is greater than the element
#   when the number argument is negative, replace an element with the n-th nearest prime number that is less than the element
def pretentious_primes(arr, n)
  pretentious_primes = []

  if n > 0
    arr.each do |x|
      primes = []
      i = (x + 1)
      while primes.length <= n
        primes << i if prime?(i)
        i +=1
      end
      pretentious_primes << primes[n-1]
    end
  elsif n < 0
    arr.each do |x|
      primes = []
      i = (x - 1)
      while primes.length <= -n
        if i <= 1
          primes << nil
        else
          primes << i if prime?(i)
        end
        i -=1
      end
      pretentious_primes << primes[(-n)-1]
    end
  else
      pretentious_primes = arr
  end
  pretentious_primes
end