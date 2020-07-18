=begin
Warmup

Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
Write both a recursive and iterative version of sum of an array.

=end

def range(start_idx, end_idx)
    range_arr = []
    return [] if start_idx >= end_idx

    while start_idx < end_idx
        range_arr << start_idx
        start_idx += 1
    end
    range_arr
end

def range(start_idx, end_idx)
    return if start_idx >= end_idx
    [start_idx, range(start_idx+1, end_idx)].flatten
end

=begin
Exponentiation

Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
exp(b, 0) = 1
exp(b, n) = b * exp(b, n - 1)

# recursion 2
exp(b, 0) = 1
exp(b, 1) = b
exp(b, n) = exp(b, n / 2) ** 2             [for even n]
exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

=end

def exp(base, exponent)
    return base if exponent == 1
    base * exp(base, exponent-1)
end

def exp(base, exponent)
    return base if exponent == 1
    return 1 if exponent == 0

    half_exponent = exponent / 2
    smaller_half_exponent = (exponent-1) / 2
    even_exp = exp(base, half_exponent)
    odd_exp = exp(base, smaller_half_exponent)

    if exponent.even?
        even_exp * even_exp
    elsif exponent.odd?
         base * odd_exp * odd_exp
    end
end

=begin
Deep dup

The #dup method doesn't make a deep copy:

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

It's okay to iterate over array elements using the normal each for this one :-)

You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

=end

class Array

    def deep_dup
        dup_arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                dup_arr << ele.deep_dup
            else
                dup_arr << ele
            end
        end
        dup_arr
    end

end

=begin
Fibonacci

Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

=end

def fibonacci(n)
    fibs = [1,1]
    return [1, 1].take(n) if n <= 2

    while fibs.length < n
        fibs << (fibs[-1] + fibs[-2])
    end
    fibs
end

def fibs_rec(n)
  if n <= 2
    [1, 1].take(n)
  else
    fibs = fibs_rec(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

=begin
Binary Search

The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).
Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.
Make sure that these test cases are working:

bsearch([1, 2, 3], 1) # => 0
bsearch([2, 3, 4, 5], 3) # => 1
bsearch([2, 4, 6, 8, 10], 6) # => 2
bsearch([1, 3, 4, 5, 9], 5) # => 3
bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

=end

def bsearch(array, target)
    return nil if !array.include?(target)
    arr = array.sort

    mid = arr.length / 2


    if arr[mid] == target
        return mid
    elsif arr[mid] < target
        mid + bsearch(arr[mid..-1], target)
    else
        bsearch(arr[0..mid-1], target)
    end
end

=begin
Merge Sort

Implement a method merge_sort that sorts an Array:

    The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
    You'll want to write a merge helper method to merge the sorted halves.
    To get a visual idea of how merge sort works, watch this gif and check out this diagram.

=end

class Array
    def merge_sort
        return self if count < 2
        
        mid = count / 2

        left, right = self.take(mid), self.drop(mid)
        sort_left, sort_right = merge_sort(left), merge_sort(right)

        merge(sort_left, sort_right)
    end


    def merge(left_sort, right_sort)
        merged_arr = []
        until left_sort.empty? || right_sort.empty?
            merged_arr << (left_sort.first < right_sort.first) ? left_sort.shift : right_sort.shift
        end

        merged_arr + left_sort + right_sort
    end
end

=begin
Array Subsets

Write a method subsets that will return all subsets of an array.

subsets([]) # => [[]]
subsets([1]) # => [[], [1]]
subsets([1, 2]) # => [[], [1], [2], [1, 2]]
subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

You can implement this as an Array method if you prefer.

Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

    Those that do not contain 3 (all of these are subsets of [1, 2]).
    For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.

=end

class Array
  def subsets
    return [[]] if empty?
    subs = take(count - 1).subsets
    subs.concat(subs.map { |sub| sub + [last] })
  end
end

def subsets(array)
  return [[]] if array == []
  old = subsets(array[0...-1]) #array=[1,2] and old = [],[1],[2],[1,2]
  old + old.map {|sub| sub + [array.last]}
end

=begin
Permutations

Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]

You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

[1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
                            #     [2, 1, 3], [2, 3, 1],
                            #     [3, 1, 2], [3, 2, 1]]

=end

def permutations(array)
  return [array] if array.length <= 1


  # Similar to the subsets problem, we observe that to get the permutations
  # of [1, 2, 3] we can look at the permutations of [1, 2] which are
  # [1, 2] and [2, 1] and add the last element to every possible index getting
  # [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1]

  # pop off the last element
  first = array.shift
  # make the recursive call
  perms = permutations(array)
  # we will need an array to store all our different permutations
  total_permutations = []


  # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
  # and for each permutation add first into every index. This new subarray
  # gets added to total_permutations.
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total_permutations
end

#http://web.archive.org/web/20130215052843/http://rubyquiz.com/quiz154.html

def make_change(amount, coins = [25,10,5,1])
    coins.sort.
        reverse.
        map{|coin| f = amount/coin; amount %= coin; Array.new(f){coin} }.
        flatten
end

def make_change(target, coins = [25, 10, 5, 1])
  # Don't need any coins to make 0 cents change
  return [] if target == 0
  # Can't make change if all the coins are too big. This is in case
  # the coins are so weird that there isn't a 1 cent piece.
  return nil if coins.none? { |coin| coin <= target }

  # Optimization: make sure coins are always sorted descending in
  # size. We'll see why later.
  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    # can't use this coin, it's too big
    next if coin > target

    # use this coin
    remainder = target - coin

    # Find the best way to make change with the remainder (recursive
    # call). Why `coins.drop(index)`? This is an optimization. Because
    # we want to avoid double counting; imagine two ways to make
    # change for 6 cents:
    #   (1) first use a nickel, then a penny
    #   (2) first use a penny, then a nickel
    # To avoid double counting, we should require that we use *larger
    # coins first*. This is what `coins.drop(index)` enforces; if we
    # use a smaller coin, we can never go back to using larger coins
    # later.
    best_remainder = make_change(remainder, coins.drop(index))

    # We may not be able to make the remaining amount of change (e.g.,
    # if coins doesn't have a 1cent piece), in which case we shouldn't
    # use this coin.
    next if best_remainder.nil?

    # Otherwise, the best way to make the change **using this coin**,
    # is the best way to make the remainder, plus this one coin.
    this_change = [coin] + best_remainder

    # Is this better than anything we've seen so far?
    if best_change.nil? || (this_change.count < best_change.count)
      best_change = this_change
    end
  end

  best_change
end