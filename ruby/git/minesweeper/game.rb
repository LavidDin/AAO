require './board.rb'

class Game
  def initialize
    @board = Board.new

  end

  def play
    @board.print
    until @board.won? || self.reveal_square == false
      self.reveal_square
      @board.print
    end

    if @board.won?
      puts 'Congratulations you win!'
    elsif self.reveal_square == false
      puts 'You hit a bomb. That means you lose!'
    end
  end

  def reveal_square
    p 'enter a position you would like to reveal using coordinates separated with a space like `0 7`'
    position = gets.chomp.split(' ').map(&:to_i)
    false if @board.reveal(position)
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