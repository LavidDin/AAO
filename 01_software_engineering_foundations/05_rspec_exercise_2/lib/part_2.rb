def palindrome?(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome?(string[1..-2])
    else
      false
    end
  end
end


def substrings(string)
array = []
x = 0

  while x <= string.length-2
    y=x+1
    array << string[x]
    while y <= string.length-1
      array << string[x..y]
      y +=1
    end
    x +=1
  end
  array << string[-1]

array
end

substrings("jump")

=begin
def substrings(string)
    substrings = []
    (0...string.length).each do |start_idx|
        (start_idx...string.length).each do |end_idx|
            string[start_idx..end_idx]
        end
    end
    substrings
end
=end


def palindrome_substrings(string)
array = substrings(string)
palindromes = []

 array.each do |ele|
    if palindrome?(ele) == true && ele.length > 1
        palindromes << ele
    end
end
palindromes
end

=begin
def palindrome_substrings(string)
    substrings(strings).select { |substr| palindrome?(substr) }
end
=end