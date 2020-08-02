require_relative 'tile'


class Board
    attr_reader :board

    def initialize
        @mines = []
        @board = Array.new(9) { Array.new(9) { Tile.new(0) } }
        place_mines
    end

    def place_mines
    mine_count = 0

        while mine_count < 9 do
            x = rand(8)
            y = rand(8)

            if !@mines.include?(@tiles[y][x])
                @tiles[y][x].mine = true
                @mines << @tiles[y][x]
            end
        end
    end
    puts @board

end