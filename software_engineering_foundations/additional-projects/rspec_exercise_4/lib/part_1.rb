def my_reject(arr, &prc)
    new_arr = []
    arr.each do |i|
        new_arr << i if !prc.call(i)
    end
    new_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each do |i|
        count += 1 if prc.call(i)
    end

    return true if count == 1
    return false
end
#array.count(&prc) == 1 also works

def hash_select(hash, &prc)
    new_hash = Hash.new(0)
    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    new_hash
end

def xor_select(array, prc_1, prc_2)
  array.select do |el|
    (prc_1.call(el) || prc_2.call(el)) && !(prc_1.call(el) && prc_2.call(el))
  end
end

def proc_count(val, procs)
  procs.count { |prc| prc.call(val) }
end