require relative "card"

class Board
attr_reader :size

  def initialize(size = 4)
    @rows = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def [](pos)
      row, col = pos
      rows[row][col]
  end

  def []=(pos, val)
      row, col = pos
      rows[row][col] = value
  end

  def populate

  end

  def render

  end

  def won?

  end

  def reveal

  end




end