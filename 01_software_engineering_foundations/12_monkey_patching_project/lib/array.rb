# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
      return nil if self.empty?

      self.max - self.min
    end

    def average
      return nil if self.empty?

      self.sum / (self.length * 1.0)
    end

    def median
      return nil if self.empty?

      if self.length.odd?
        mid_index = self.length / 2
        return self.sort[mid_index]
      else
        sorted = self.sort
        mid_index = self.length / 2
        second_index = mid_index - 1
        return (sorted[mid_index] + sorted[second_index]) / 2.0
      end
    end

    def counts
      count = Hash.new(0)
      self.each { |ele| count[ele] += 1}
      count
    end

    def my_count(target)
      num = 0

      self.each do |ele|
        if ele == target
          num +=1
        end
      end
      num
    end

    def my_index(value)
      return nil if self.include?(value) == false

      self.each_with_index do |ele, i|
        if ele == value
          return i
        end
      end
    end

    def my_uniq
      hash = {}
      self.each { |ele| hash[ele] = true}
      hash.keys
    end

    def my_transpose
      new_arr = []

      (0...self.length).each do |row|
        new_row = []

        (0...self.length).each do |col|
          new_row << self[col][row]
        end

        new_arr << new_row
      end
      new_arr
    end
end
