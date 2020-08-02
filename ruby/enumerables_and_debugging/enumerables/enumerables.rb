class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        selects = []

        self.my_each do |item|
        selects << item if prc.call(item)
        end

        selects
    end

    def my_reject(&prc)
        rejected = []
        self.my_each do |i|
            rejected << i if !prc.call(self[i])
        end
        rejected
    end

    def my_any?(&prc)
        self.my_each do |item|
        return true if prc.call(item)
        end

        false
    end

    def my_all?(&prc)
        self.my_select.length == self.length
    end

    def my_flatten
        flattened = []

        self.my_each do |ele|
            if ele.is_a?
                flattened.concat(ele.my_flatten)
            else
                flattened << ele
            end
        end
        flattened
    end

  def my_zip(*arrays)
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]

      arrays.my_each do |array|
        subzip << array[i]
      end

      zipped << subzip
    end

    zipped
  end

    def my_rotate(positions = 1)
        split_idx = positions % self.length

        self.drop(split_idx) + self.take(split_idx)
    end

    def my_join(separator = '')
        joined = ''

        self.length.times do |i|
            joined += self[i]
            joined += separator unless i == self.length -1
        end
        joined
    end

    def my_reverse
        reversed = []
            self.length.times do |i|
                reversed.unshift self[i]
        end
        reversed
    end
    
end