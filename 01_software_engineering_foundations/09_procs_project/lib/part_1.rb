def my_map(arr, &prc)
    mapped = []
    arr.each { |el| mapped << prc.call(el) }
    mapped
end

def my_select(arr, &prc)
    selected = []
    arr.each { |el| selected << el if prc.call(el) }
    selected
end

def my_count(arr, &prc)
    counted = 0
    arr.each { |el| counted+=1 if prc.call(el) }
    counted
end

def my_any?(arr, &prc)
    arr.each { |el| return true if prc.call(el) }
    false
end

def my_all?(arr, &prc)
    all = []
    arr.each { |el| all << el if prc.call(el) }
    all == arr
end

def my_none?(arr, &prc)
    none = []
    arr.each { |el| return false if prc.call(el) }
    true
end