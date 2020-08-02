#Phase 1: Modest problems.
#duos
#Write a method duos that accepts a string as an argument and returns the count of the number of times the same character appears consecutively in the given string.
def duos(str)
  count = 0
  str.each_char.with_index do |char, idx|
    count += 1 if char == str[idx+1]
  end
  count
end

#sentence_swap
#Write a method sentence_swap that accepts a sentence and a hash as arguments.
#The method should return a new sentence where every word is replaced with it's corresponding value in the hash.
#If a word does not exist as a key of the hash, then it should remain unchanged.
def sentence_swap(sentence, hash)
  new_sentence = []
  sentence_arr = sentence.split(' ')

  sentence_arr.each do |word|
    new_word = word
    if hash.has_key?(word)
      value = hash[word]
      new_word = value
    end
    new_sentence << new_word
  end
  new_sentence.join(' ')
end

#hash_mapped
#Write a method hash_mapped that accepts a hash, a proc, and a block.
#The method should return a new hash where each key is the result of the original key when given to the block.
#Each value of the new hash should be the result of the original values when passed into the proc.
def hash_mapped(hash, proc_a, &prc)
  new_hash = Hash.new(0)

  hash.each do |k, v|
    new_k = prc.call(k)
    new_hash[new_k] = proc_a.call(v)
  end
  new_hash
end

#counted_characters
#Write a method counted_characters that accepts a string as an argument.
#The method should return an array containing the characters of the string that appeared more than twice.
#The characters in the output array should appear in the same order they occur in the input string.
def counted_characters(str)
  arr = str.split('')
  new_arr = []
  counted = element_count(arr)

  counted.each do |k, v|
    new_arr << k if v > 2
  end
  new_arr
end

def element_count(arr)
  count = Hash.new(0)
  arr.each { |ele| count[ele] += 1 }
  return count
end

#triplet_true?
#Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains three of the same character consecutively.
def triplet_true?(str)
  str.each_char.with_index do |char, idx|
    return true if char == str[idx+1] && char == str[idx+2]
  end
  false
end

#energetic_encoding
#Write a method energetic_encoding that accepts a string and a hash as arguments.
#The method should return a new string where characters of the original string are replaced with the corresponding values in the hash.
#If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.
def energetic_encoding(str, hash)
  new_str = []
  arr = str.split(' ')

  arr.each do |word|
    new_word = ''
    word.each_char do |char|
      if hash.has_key?(char)
        new_word += hash[char]
      else
        new_word += '?'
      end
    end
    new_str << new_word
  end

  new_str.join(' ')
end

#uncompress
#Write a method uncompress that accepts a string as an argument.
#The string will be formatted so every letter is followed by a number.
#The method should return an "uncompressed" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter.
def uncompress(str)
  uncompressed = ''
  (0...str.length - 1).each do |i|
    letter = str[i]
    num = str[i + 1].to_i
    uncompressed += letter * num
  end
  uncompressed
end

#Phase 2: More difficult, maybe?
#conjunct_select
#Write a method conjunct_select that accepts an array and one or more procs as arguments.
#The method should return a new array containing the elements that return true when passed into all of the given procs.
def conjunct_select(arr, *procs)
  new_arr = []

  arr.each do |ele|
    count = 0
    procs.each do |proc_idx|
      count += 1 if proc_idx.call(ele)
    end
    new_arr << ele if count == procs.length
  end
  new_arr
end

def conjunct_select(array, *prcs)
  array.select { |el| prcs.all? { |prc| prc.call(el) } }
end

#convert_pig_latin
#Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
#words that are shorter than 3 characters are unchanged
    #words that are 3 characters or longer are translated according to the following rules:
    #if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
    #if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
def convert_pig_latin(sentence)
  translated = []

  sentence.split(' ').each do |word|
    if word.length > 2
      translated << pig_latin(word)
    else
      translated << word
    end
  end
  translated.join(' ')
end

def pig_latin(word)
  new_word = ''
  vowel_idx = first_vowel(word)

  if vowel_idx == nil
    new_word = word
  elsif vowel_idx == 0
    new_word = word + 'yay'
  else
    new_word = word[vowel_idx..-1] + word[0...vowel_idx] + 'ay'
  end

  new_word= new_word.downcase.capitalize if word[0] == word[0].upcase

  new_word
end

def first_vowel(word)
  vowels = 'aeiou'
  word.each_char.with_index do |char, idx|
    return idx if vowels.include?(char)
  end
  nil
end

#reverberate
#Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
    #words that are shorter than 3 characters are unchanged
    #words that are 3 characters or longer are translated according to the following rules:
    #if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
    #if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
def reverberate(sentence)
    new_sentence = []

  sentence.split(' ').each do |word|
    if word.length > 2
      new_sentence << reverberated(word)
    else
      new_sentence << word
    end
  end
  new_sentence.join(' ')
end

def reverberated(word)
  vowels = 'aeiou'
  new_word = ''
  last_vowel_idx = last_vowel(word)
  if word[last_vowel_idx] == word[-1]
    new_word = word + word.downcase
  else
    new_word = word + word[last_vowel_idx..-1]
  end
  new_word
end

def last_vowel(word)
  vowels = 'aeiou'
  vowels_idx = []

  word.each_char.with_index do |char, idx|
    vowels_idx << idx if vowels.include?(char)
  end
  vowels_idx[-1]
end

#disjunct_select
#Write a method disjunct_select that accepts an array and one or more procs as arguments.
#The method should return a new array containing the elements that return true when passed into at least one of the given procs.
def disjunct_select(arr, *procs)
  new_arr = []

  arr.each do |ele|
    count = 0
    procs.each do |proc_idx|
      count += 1 if proc_idx.call(ele)
    end
    new_arr << ele if count >= 1
  end
  new_arr
end

def disjunct_select(array, *prcs)
  array.select { |el| prcs.any? { |prc| prc.call(el) } }
end

#alternating_vowel
#Write a method alternating_vowel that accepts a sentence as an argument.
#The method should return a new sentence where the words alternate between having their first or last vowel removed.

=begin
uses first_vowel and last_vowel
=end
def alternating_vowel(sentence)
  new_sentence = []
  sentence_arr = sentence.split(' ')
  
  sentence_arr.each.with_index do |word, idx|
    new_word = ''

    if idx % 2 == 0
      first_vowel_idx = first_vowel(word)
      new_word << word[0...first_vowel_idx] + word[first_vowel_idx+1..-1]
    else
      last_vowel_idx = last_vowel(word)
      new_word << word[0...last_vowel_idx] + word[last_vowel_idx+1..-1]
    end
    new_sentence << new_word
  end
  new_sentence.join(' ')
end

#silly_talk
#Write a method silly_talk that accepts a sentence as an argument. The method should translate each word of the sentence according to the following rules:
    #if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
    #if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
def silly_talk(sentence)
  vowels = 'aeiou'
  new_sentence = []

  sentence.split(' ').each do |word|
    new_word = ''
    if vowels.include?(word[-1])
        new_word = word + word[-1]
    else
      word.each_char do |char|
        if vowels.include?(char.downcase)
          new_word << char + 'b' + char.downcase
        else
          new_word << char
        end
      end
    end
    new_sentence << new_word
  end

  new_sentence.join(' ')
end

#compress
#Write a method compress that accepts a string as an argument.
#The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak.
#If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.
def compress(str)
  compressed = ''
  chars = str.split('')
  idx = 0

  while idx <= chars.length-1
    streak = 1
    char = chars[idx]
    while chars[idx] == chars[idx+1]
      streak += 1
      idx+= 1
    end
    idx += 1
    if streak > 1
      compressed += char + streak.to_s
    else
      compressed += char
    end
  end
  compressed
end