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
    Board.reveal(position)
  end
=begin
  def flag
    p 'enter a position you would like to flag using coordinates separated with a space like `0 7`'
    
  end
=end

end