class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      self.take_turn
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    self.round_success_message if @game_over == false
    @sequence_length += 1
  end

  def show_sequence
    self.add_random_color
    puts @seq
  end

  def require_sequence
    puts 'enter the correct sequence'
    guess_seq = gets.chomp.split(' ')
    @game_over = true if @seq != guess_seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts 'Good job! You got the sequence right this round'
  end

  def game_over_message
    puts 'game over'
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
