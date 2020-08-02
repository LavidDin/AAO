class Item
  def self.valid_date?(date_string)
    date = date_string.split('-').map!(&:to_i)
    date[0] > 1900 && date[0] < 2100 && date[1] >0 && date[1] < 13 && date[2] > 1 && date[2] < 32
  end

  attr_reader :deadline, :done
  attr_accessor :title, :description

  def initialize(title, deadline, description)
    raise ArgumentError.new "deadline is not valid" if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def deadline=(new_deadline)
    raise ArgumentError.new "deadline is not valid" if !Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end

  def toggle
    @done = !@done
  end
end