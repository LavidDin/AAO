def element_count(arr)
    elements = Hash.new(0)
    arr.each { |ele| elements[ele] += 1 }
    return elements
end

def char_replace!(str, hash)
  (0...str.length).each do |i|
    if hash.has_key?(str[i])
      str[i] = hash[str[i]]
    end
  end

  str
end

def product_inject(arr)
    return arr.inject(1) { |product, n| product * n }
end