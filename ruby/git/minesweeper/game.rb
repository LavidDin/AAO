require './board.rb'

class Game
  def initialize
    @board = Board.new

  end

  def print
    @board.print
  end

  def reveal_square
    p 'enter a position you would like to reveal using coordinates separated with a space like `0 7`'
    position = gets.chomp.split(' ').map(&:to_i)
    @board.reveal(position)
    self.print
  end

  def reveal_adjacent
    p 'enter a position you would like to reveal using coordinates separated with a space like `0 7`'
    position = gets.chomp.split(' ').map(&:to_i)
    @board.reveal_adjacent(position[0],position[1])
    self.print
  end
=begin
  def flag
    p 'enter a position you would like to flag using coordinates separated with a space like `0 7`'
    
  end
=end

end