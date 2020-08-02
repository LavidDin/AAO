def zip(*arrays)
  length = arrays.first.length

  (0...length).map do |i|
    arrays.map { |array| array[i] }
  end
end

def prizz_proc(arr, prc_1, prc_2)
  new_arr = []

  arr.each do |ele|
    new_arr << ele if (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))
  end
  new_arr
end

def zany_zip(*arrays)
  length = arrays.map(&:length).max

  (0...length).map do |i|
    arrays.map { |array| array[i] }
  end
end

def maximum(arr, &prc)
  return nil if arr.empty?
  max = arr.first
  arr.each do |ele|
    max = ele if prc.call(ele) >= prc.call(max)
  end
  max
end

def my_group_by(array, &prc)
  groups = Hash.new { |h, k| h[k] = [] }

  array.each do |ele|
    key = prc.call(ele)
    groups[key] << ele
  end
  groups
end

def max_tie_breaker(arr, tie_breaker, &prc)
  return nil if arr.empty?

  max = arr.first
  arr.each do |ele|
    if prc.call(ele) > prc.call(max)
      max = ele
    elsif prc.call(ele) == prc.call(max)
      max = ele if tie_breaker.call(ele) > tie_breaker.call(max)
    end
  end

  max
end

def change_word(word)
  indices = vowel_indices(word)
  word[indices.first..indices.last]
end

def vowel_indices(word)
  vowels = 'aeiou'
  indices = []
  word.each_char.with_index do |char, i|
    indices << i if vowels.include?(char)
  end
  indices
end

def silly_syllables(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
    num_vowels = vowel_indices(word).length
    if num_vowels < 2
      word
    else
      change_word(word)
    end
  end

  new_words.join(' ')
end

=begin
    
def silly_syllables(sentence)
  new_sentence = []
  vowels = 'aeiou'

  sentence.split(' ').each do |word|
    vowel_indices = []

    word.each_char.with_index do |char, idx|
      vowel_indices << idx if vowels.include?(char)
    end

    if vowel_indices.length < 2
      new_sentence << word
    else
      new_sentence << word[vowel_indices[0]..vowel_indices[-1]]
    end
  end

  new_sentence.join(' ')
end

end