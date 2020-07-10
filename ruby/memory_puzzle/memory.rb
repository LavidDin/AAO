require relative "board"
require relative "human_player"
require relative "computer_player"

class MemoryGame

  def initialize(player, size = 4)
    @board = Board.new(size)
    @previous_guess = nil
    @player = player
  end

  def compare_guess(new_guess)


  end

  def get_player_input
    pos = nil

    until pos && valid_pos?(pos)
        pos = player.get_input
    end

    pos
  end

  def make_guess(pos)

  end










end