#Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
  count = Hash.new(0)
  arr.each { |ele| count[ele] += 1 }
  count.keys.select { |v| count[v] == 1 }
end


#Write a method no_consecutive_repeats?(arr) that accepts an array as an arg.
#The method should return true if an element never appears consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
  (0...arr.length-1).each do |i|
    return false if arr[i] == arr[i+1]
  end
  return true
end

#Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys.
#The value associated with each key should be an array containing the indices where that character is found.

def char_indices(str)
  str.each_char.with_index.with_object({}) { |(char,idx),hash| (hash[char] ||= []) << idx }
end

# indices = Hash.new { |h, k| h[k] = [] }
# string.each_char.with_index { |ch, idx| indices[ch] << idx}
# indices

#Write a method longest_streak(str) that accepts a string as an arg.
#The method should return the longest streak of consecutive characters in the string.
#If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
  current = ''
  longest = ''

  (0...str.length).each do |i|
    if str[i] == str[i-1] || i == 0
      current += str[i]
    else
      current = str[i]
    end

    if current.length >= longest.length
      longest = current
    end
  end

    longest
end

#Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime.
#A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

def bi_prime?(num)
  prime_factors = []

  (2...num).each do |i|
    prime_factors << i if prime?(i)
  end

  prime_factors.each do |i|
    prime_factors.each do |x|
      return true if i * x == num
    end
  end
  false
end

def prime?(num)
  (2...num).each do |i|
    if num % i == 0
      return false
    else 
      return true
    end
  end
end

#Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message.
#Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
  new_str = ''
  alphabet = ('a'..'z').to_a

  message.each_char.with_index do |char, idx|
      start_pos = alphabet.index(char)
      new_pos = start_pos + keys[idx % keys.length]
      new_str += alphabet[new_pos % alphabet.length]
  end
  new_str
end

#Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the appears before it sequentially in the original string.
#The first vowel of the string should be replaced with the last vowel.

def vowel_rotate(str)
  vowels = 'aeiou'
  new_str = str[0..-1]
  vowel_indices = (0...str.length).select { |char| vowels.include?(char) }
  new_vowel_indices = vowel_indices.rotate(-1)

  vowel_indices.each_with_index do |vowel_idx, i|
    new_vowel = str[new_vowel_indices[i]]
    new_str[vowel_idx] = new_vowel
  end
  new_str
end

#Class methods
class String
    def select(&prc)
      return '' if prc.nil?
      new_str = ''

      self.each_char do |char|
        new_str += char if prc.call(char)
      end
      new_str
    end

    def map!(&prc)
      self.each_char.with_index { |char,idx| self[idx] = prc.call(char, idx)}
    end
end

#Recursion

#Write a method multiply(a, b) that takes in two numbers and returns their product.

def multiply(a, b)
  return 0 if b == 0
  if b > 0
    a + multiply(a, b-1)
  else b < 0
    -(a + multiply(a, (-b) -1))
  end
end

#Write a method lucasSequence that accepts a number representing a length as an arg.
#The method should return an array containing the Lucas Sequence up to the given length.
#Solve this recursively.

def lucas_sequence(length)
  if length == 0
    arr = []
  elsif length == 1
    arr = [2]
  elsif length == 2
    arr = [2, 1]
  else
    arr = lucas_sequence(length-1)
    arr <<  (lucas_sequence(length-1)[-1] + lucas_sequence(length-1)[-2])
  end
  arr
end

#Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number.
#This means that the array should contain only prime numbers that multiply together to the given num.
#The array returned should contain numbers in ascending order. Do this recursively.

def prime_factorization(num)
  (2...num).each do |factor|
    if num % factor == 0
      other_fact = num / factor
      return [ *prime_factorization(factor), *prime_factorization(other_fact) ]
    end
  end
    [num]
end