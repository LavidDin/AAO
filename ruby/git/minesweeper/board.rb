require './tile'

class Board
CELL_MOVES = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1,1]]
  
  #section to print the grid using the status of each tile
  def print_grid(arr)
    print_grid = []

    arr.each do |row|
      current_row = []
      row.each do |tile|
        current_row << tile.status
      end
      print_grid << current_row
    end
  
    render(print_grid)
  end

  #method to join and render the grid
  def render(arr)
    arr.each do |row|
      puts row.join(" ")
    end
  end

  attr_accessor :grid

  def initialize
    @mines = []
    @grid = Array.new(9) { Array.new(9) { Tile.new } }
    place_mines
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, val)
    row, col = position
    @grid[row][col].status = val
  end

  def num_mines
    count = 0
    @grid.flatten.count { |ele| ele.mine == true }
  end

  def num_adjacent_mines(position)
    row, col = position
    adjacent_mines_count = 0

    CELL_MOVES.each do |move|
      if @grid[row+move[0]][col+move[1]].mine == true
        adjacent_mines_count += 1
      end
    end

    @grid[row][col].adjacent_mines_count = adjacent_mines_count
  end


  def reveal(position)
    row, col = position

    if @grid[row][col].mine == true
      puts 'You hit a bomb. That means you lose!'
      false
    else
      @grid[row][col].revealed = true
    end

    if @grid[row][col].adjacent_mines_count == 0
      CELL_MOVES.each do |move|
        @grid[row+move[0]][col+move[1]].revealed = true
        #@grid[row+move[0]][col+move[1]].status
      end
    end

  end

  def reveal_adjacent(row, col)
    if @grid[row][col].adjacent_mines_count == 0
      CELL_MOVES.each do |move|
        move_row = row + move[0]
        move_col = col +move[1]
        @grid[move_row][move_col].revealed = true
        self.reveal_adjacent(move_row,move_col)
      end
    end

  end
  
  def place_mines
    while num_mines < 9 do
    row = rand(8)
    col = rand(8)

      if @grid[row][col].mine == false
        @grid[row][col].mine = true
      end
    end
  end



  def cheat
    print_grid(@grid)
  end

  def print
    print_grid(@grid)
  end
end