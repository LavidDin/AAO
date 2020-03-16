def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |subarr| subarr.sum > 0}
end

def aba_translate(str)
    aba_str = ""
    vowels = "aeoiu"
    str.each_char do |char|
        if vowels.include?(char)
            aba_str += char + "b" + char
        else
            aba_str += char
        end
    end
    return aba_str
end

def aba_array(arr)
    aba_arr = []
    arr.map do |word| 
        aba_arr << aba_translate(word)
    end
    return aba_arr
end