def my_reject(arr, &prc)
  rejected = []
  arr.each { |el| rejected << el if prc.call(el) == false }
  rejected
end

def my_one?(arr, &prc)
  count = 0
  arr.each { |el| count +=1 if prc.call(el)}
  count === 1
end

def hash_select(hash, &prc)
  selected = Hash.new()
  hash.each { |k,v| selected[k]=v if prc.call(k,v) }
  selected
end

def xor_select(arr, proc_1, proc_2)
  arr.select do |el|
    (proc_1.call(el) || proc_2.call(el)) && !(proc_1.call(el) && proc_2.call(el))
  end
end

def proc_count(value, arr)
  count = 0
  arr.each do |proc|
    count += 1 if proc.call(value)
  end
  count
end