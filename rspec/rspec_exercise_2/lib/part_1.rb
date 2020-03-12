def partition(arr, n)
less = []
greater = []

arr.each do |ele|
    if ele < n
        less << ele
    else
        greater << ele
    end
end

[less, greater]
end

def merge(hash_1 , hash_2)
    hash_1.merge(hash_2)
end

def censor(sentence, curses)
    words = sentence.split(" ")

    new_words = words.map do |word|
        if curses.include?(word.downcase)
            star_vowels(word)
        else
            word
        end
    end
    
    new_words.join(" ")
end

def star_vowels(string)
    vowels = "aeiou"
    new_str = ""

    string.each_char do |char|
        if vowels.include?(char.downcase)
            new_str += "*"
        else
            new_str += char
        end 
    end
    new_str
end
    

def power_of_two?(num)
    Math.log2(num) % 1 == 0
end
