
def average(num_1, num_2)
    if !(num_1.instance_of?(Integer) && num_2.instance_of?(Integer))
        raise "arguments must be integers"
    end
    return (num_1 + num_2) / 2.0
end

def average_array(array)
    array.sum / (array.length * 1.0)
end

def repeat(string, num)
    output = ""
        num.times { |i| output << string}
    return output
end

def yell(string)
    string.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split(" ") 

    new_words =  words.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end
    new_words.join(" ")
end