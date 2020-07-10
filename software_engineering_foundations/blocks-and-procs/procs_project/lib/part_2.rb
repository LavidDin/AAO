def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sentence, &prc)
    new_sentence = []
    words = sentence.split(' ')
    words.each {|word| new_sentence << prc.call(word)}
    new_sentence.join(' ')
end

def greater_proc_value(num, prc_1, prc_2)
    proc_1 = prc_1.call(num)
    proc_2 = prc_2.call(num)

    greater = proc_1 > proc_2 ? proc_1 : proc_2
    greater
end

def and_selector(arr, proc_1, proc_2)
    selected = []
    arr.each { |el| selected << el if proc_1.call(el) && proc_2.call(el) }
    selected
end

def alternating_mapper(arr, proc_1, proc_2)
    mapped = arr.map.with_index do |el, idx|
        if idx % 2 == 0
            proc_1.call(el)
        else
            proc_2.call(el)
        end
    end
mapped        
end