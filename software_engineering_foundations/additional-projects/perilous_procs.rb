#Phase 1: Problems that are pleasant.

#some?
#Write a method some? that accepts an array and a block as arguments.
#The method should return a boolean indicating whether or not at least one of the elements of the array returns true when given to the block.
#Solve this using Array#each.
def some?(arr, &prc)
    arr.each { |el| return true if prc.call(el)}
    false
end

#exactly?
#Write a method exactly? that accepts an array, a number (n), and a block as arguments.
#The method should return a boolean indicating whether or not there are exactly n elements that return true when given to the block.
#Solve this using Array#each.
def exactly?(arr, n, &prc)
    count = 0
    arr.each do |ele| 
        if prc.call(ele)
            count += 1
        end
    end
    count == n
end

#filter_out
#Write a method filter_out that accepts an array and a block as arguments.
#The method should return a new array where elements of the original array are removed if they return true when given to the block.
#Solve this using Array#each.
def filter_out(arr, &prc)
    new_arr = []
    arr.each do |ele| 
        if !prc.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

#at_least?
#Write a method at_least? that accepts an array, a number (n), and a block as an arguments.
#The method should return a boolean indicating whether or not at least n elements of the array return true when given to the block.
#Solve this using Array#each.
def at_least?(arr, n, &prc)
    count = 0
    arr.each do |ele| 
        if prc.call(ele)
            count += 1
        end
    end
    count >= n
end

#every?
#Write a method every? that accepts an array and a block as arguments.
#The method should return a boolean indicating whether or not all elements of the array return true when given to the block.
#Solve this using Array#each.
def every?(arr, &prc)
    count = 0
    arr.each do |ele| 
        if prc.call(ele)
            count += 1
        end
    end
    count == arr.length
end

#at_most?
#Write a method at_most? that accepts an array, a number (n), and a block as arguments.
#The method should return a boolean indicating whether no more than n elements of the array return true when given to the block.
#Solve this using Array#each.
def at_most?(arr, n, &prc)
    count = 0
    arr.each do |ele| 
        if prc.call(ele)
            count += 1
        end
    end
    count <= n
end

#first_index
#Write a method first_index that accepts an array and a block as arguments.
#The method should return the index of the first element of the array that returns true when given to the block.
#If no element of returns true, then the method should return nil.
#Solve this using Array#each.
def first_index(arr, &prc)
    arr.each.with_index do |ele, idx| 
        return idx if prc.call(ele)
    end
    nil
end

#Phase 2: The proc thickens.

#xnor_select
#Write a method xnor_select that accepts an array and two procs as arguments.
#The method should return a new array containing elements of the original array that either return true for both procs or return false for both procs.
def xnor_select(arr, proc_1, proc_2)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if ( proc_1.call(ele) && proc_2.call(ele) ) || ( !proc_1.call(ele) && !proc_2.call(ele) )
    end
    new_arr
end

#filter_out!
#Rewrite your previous filter_out method to mutate the input array instead of returning a new array.
#That is, write a method filter_out! that accepts an array and a block as args. The method should remove elements of the input array that return true when given to the block.
#Solve this without using Array.reject!.
def filter_out!(arr, &prc)
    arr.delete_if { |ele| prc.call(ele)}
    arr
end

#multi_map
#Write a method multi_map that accepts an array, an optional number (n), and a block as arguments.
#The method should return a new array where each element of the original array is repeatedly run through the block n times.
#If the number argument is not passed in, then the the elements should be run through the block once.
def multi_map(arr, n = 1, &prc)
    new_arr = arr
    n.times do
        new_arr = new_arr.map {|ele| ele = prc.call(ele)}
    end
    new_arr
end

#proctition
#Write a method proctition that accepts an array and a block as arguments.
#The method should return a new array where the elements that return true when given to the block come before all of the elements that return false when given to the block.
#This means that the new array has two partitions; the order among elements in the same partition should be the same as their relative order in the input array.
def proctition(arr, &prc)
    true_arr = []
    false_arr = []

    arr.each do |ele|
        if prc.call(ele)
            true_arr << ele
        else
            false_arr << ele
        end
    end
    true_arr.concat(false_arr)
end

#Phase 3: Perilous.

#selected_map!
#Write a method selected_map! that accepts an array and two procs as arguments.
#The method should replace the elements that return true when passed into the first proc with their return values when they are passed into the second proc.
#This method should mutate the input array and return nil.
def selected_map!(arr, proc_1, proc_2)
    arr.each.with_index do |ele, idx|
        if proc_1.call(ele)
            arr[idx] = proc_2.call(ele)
        end
    end
    nil
end

#chain_map
#Write a method that accepts any value and an array of procs as an argument. The method should return the final result of feeding the value through all of the procs. For example, if the array contains three procs, then:
#   the value is given to the first proc
#   the result of the first proc is given to the second proc
#   the result of the second proc is given to the third proc
#   the result of third proc is the final result
def chain_map(value, arr)
    arr.each do |proc_idx|
        value = proc_idx.call(value)
    end
    value
end

#proc_suffix
#Write a method proc_suffix that accepts a sentence and a hash as arguments.
#The hash contains procs as keys and suffix strings as values.
#The method should return a new sentence where each word of the original sentence is appended with a suffix if the original word returns true when given to the corresponding proc key.
#If an original word returns true for multiple procs, then the suffixes should be appended in the order that they appear in the input hash.
def proc_suffix(sentence, hash)
    new_sentence = []

    sentence.split(' ').each do |word|
        new_word = word
        hash.each do |k, v|
            new_word += v if k.call(word)
        end
        new_sentence << new_word
    end
    new_sentence.join(' ')
end

#proctition_platinum
#Write a method proctition_platinum that accepts an array and any number of additional procs as arguments.
#The method should return a hash where the keys correspond to the number of procs passed in.
def proctition_platinum(arr, *prcs)
    hash = Hash.new { |k, v| k[v] = [] }

    arr.each do |ele|
        proc_count = 0
        prcs.each do |proc_idx|
            proc_count += 1 if proc_idx.call(ele)
        end
        hash[proc_count] << ele if proc_count > 0
    end
    hash
end

#procipher
#Write a method procipher that accepts a sentence and a hash as arguments.
#The hash contains procs as both keys and values.
#The method should return a new sentence where each word of the input sentence is changed by a value proc if the original word returns true when passed into the key proc.
#If an original word returns true for multiple key procs, then the value proc changes should be applied in the order that they appear in the hash.
def procipher(sentence, hash)
    new_sentence = []
    sentence.split(' ').each do |word|
        new_word = word
        hash.each do |k, v|
            new_word = v.call(new_word) if k.call(word)
        end
        new_sentence << new_word
    end
    new_sentence.join(' ')
end

#picky_procipher
#Write a method picky_procipher that accepts a sentence and a hash as arguments.
#The hash contains procs as both keys and values.
#The method should return a new sentence where each word of the input sentence is changed by a value proc if the original word returns true when passed into the key proc.
#If an original word returns true for multiple key procs, then only the value proc that appears earliest in the hash should be applied.
def picky_procipher(sentence, hash)
    new_sentence = []
    sentence.split(' ').each do |word|
        proc_count = 0
        new_word = word
        hash.each do |k, v|
            if k.call(word) && proc_count < 1
                new_word = v.call(new_word)
                proc_count +=1
            end
        end
        new_sentence << new_word
    end
    new_sentence.join(' ')
end