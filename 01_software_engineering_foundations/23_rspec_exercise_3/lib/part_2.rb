def element_count(arr)
  count = Hash.new(0)
  arr.each { |ele| count[ele] += 1}
  count
end

def char_replace!(str, hash)
  str.each_char.with_index { |char, idx| str[idx] = hash[char] if hash.has_key?(char)}
end

def product_inject(arr)
  arr.inject { |acc, el| acc * el}
end