class Tile
  attr_accessor :mine, :revealed, :adjacent_mines_count

  def initialize
      @mine = false
      @revealed = false
      @flagged  = false
      @status = ''
      @adjacent_mines_count = 0
  end

  def []=(bool)
    @mine = bool
  end

  def status
    if @mine == true
      status = 'B'
    #elsif @revealed == false && @flagged == true
    #  status = 'F'
    elsif @revealed == false
      status = '*'
    #elsif @flagged == true
    #  status = 'F'
    elsif @revealed == true && @adjacent_mines_count > 0
      status = @adjacent_mines_count
    elsif @revealed == true
      status = '-'
    end

    status
  end

  def mine_count=(mine_count)
    @status = mine_count
  end

  def flag
    @flagged = true
  end


end