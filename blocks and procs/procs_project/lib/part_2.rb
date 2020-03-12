def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sentence, &prc)
    sentence_array = sentence.split(" ")
    changed = []
    sentence_array.each do |word|
        changed << prc.call(word)
    end
    changed.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    proc_1 = prc_1.call(num)
    proc_2 = prc_2.call(num)

    greater = proc_1 > proc_2 ? proc_1 : proc_2
    greater
end

def and_selector(array, prc_1, prc_2)
    selected = []

    array.each do |num|
        if prc_1.call(num) && prc_2.call(num)
            selected << num
        end
    end
    selected
end

def alternating_mapper(array, prc_1, prc_2)
    alternated = []

    array.each.with_index do |num, i|
        if i.even?
            alternated << prc_1.call(num)
        else
            alternated << prc_2.call(num)
        end
    end
    alternated
end