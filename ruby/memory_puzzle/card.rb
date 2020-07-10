class Card
  VALUES = ("A".."Z").to_a

  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def to_s
    revealed? ? value.to_s : " "
  end

  def revealed?
    @revealed
  end

  def ==(object)
    object.is_a?(self.class) && object.value == value
  end
end