# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)

  largest = 1
  (2..num).each do |i|
    if prime?(i) == true && i > largest && num % i ==0
      largest = i
    end
  end
  largest
end

def prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end

#####################################################################

def unique_chars?(string)
  string.each_char do |c|
    return false if letter_count(string, c) >= 2
  end
  true
end

def letter_count(string, char)
  count = 0
  string.downcase.each_char do |c| 
    count += 1 if c == char
  end
  count
end

#####################################################################

def dupe_indices(array)
  indices = Hash.new { |h, k| h[k] = [] }

  array.each_with_index do |ele, i|
    indices[ele] << i
  end

  indices.select { |ele, arr| arr.length > 1}
end

#####################################################################

def ana_array(arr1, arr2)
  count_1 = ele_count(arr1)
  count_2 = ele_count(arr2)
  count_1 == count_2
end

def ele_count(arr)
  count = Hash.new(0)

  arr.each { |ele| count[ele] += 1 }
  count
end