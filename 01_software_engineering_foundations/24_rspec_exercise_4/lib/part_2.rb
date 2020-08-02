def proper_factors(num)
  factors = []
  (1...num).each do |i|
    factors << i if num % i == 0
  end
  factors
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(num)
  ideal_arr = []
  i = 1
  while ideal_arr.length < num
    ideal_arr << i if perfect_number?(i)
    i+= 1
  end
  ideal_arr
end

