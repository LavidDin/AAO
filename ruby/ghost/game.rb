require "set"
require_relative "player"

class Game
    ALPHABET = Set.new("a".."z")
    MAX_LOSS_COUNT = 5
    attr_reader :current_player

    def initialize(*players)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players
        @losses = Hash.new { |losses, player| losses[player] = 0 }
    end

    def run
        play_round until game_over?
        puts "#{winner} wins!"
    end

    def current_player
        @players[0]
    end

    def previous_player
        @players[-1]
    end

    def next_player!
        @players.rotate
    end

    def game_over?
    remaining_players == 1
  end

    def play_round
    @fragment = ''

    until round_over?
        take_turn
        next_player!
    end

    update_standings
    end

    def take_turn(player)
    letter = nil

    p "It is #{current_player}'s turn!"
        until letter
        letter = current_player.guess(fragment)

        unless valid_play?(letter)
        current_player.alert_invalid_guess(letter)
        letter = nil
        end 
    end

    def valid_play?(letter)
        return false unless ALPHABET.include?(letter)

        potential_fragment = fragment + letter
        dictionary.any? { |word| word.start_with?(potential_fragment) }
    end

    def update_standings
    system("clear")
    puts "#{previous_player} spelled #{fragment}."
    puts "#{previous_player} gets a letter!"
    sleep(1)

    if losses[previous_player] == MAX_LOSS_COUNT - 1
      puts "#{previous_player} has been eliminated!"
      sleep(1)
    end
    
    losses[previous_player] += 1
  end
end